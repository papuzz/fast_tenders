import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/models.dart';

abstract class PaymentRepository {
  Future<Payment> createPayment(Payment payment);
  Future<Payment?> getPayment(String id);
  Future<List<Payment>> getPaymentsByBooking(String bookingId);
  Future<Payment> updatePaymentStatus(
    String id,
    PaymentStatus status, {
    String? transactionId,
  });
  Future<String> initiateChapaPayment(ChapaPaymentRequest request);
  Future<void> processChapaWebhook(ChapaWebhookData webhookData);
}

class SupabasePaymentRepository implements PaymentRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<Payment> createPayment(Payment payment) async {
    final response = await _supabase
        .from('payments')
        .insert(payment.toJson())
        .select()
        .single();
    return Payment.fromJson(response);
  }

  @override
  Future<Payment?> getPayment(String id) async {
    final response = await _supabase
        .from('payments')
        .select()
        .eq('id', id)
        .single();
    return Payment.fromJson(response);
  }

  @override
  Future<List<Payment>> getPaymentsByBooking(String bookingId) async {
    final response = await _supabase
        .from('payments')
        .select()
        .eq('booking_id', bookingId);
    return response.map((json) => Payment.fromJson(json)).toList();
  }

  @override
  Future<Payment> updatePaymentStatus(
    String id,
    PaymentStatus status, {
    String? transactionId,
  }) async {
    final updateData = {
      'status': status.name,
      if (transactionId != null) 'transaction_id': transactionId,
      if (status == PaymentStatus.completed)
        'completed_at': DateTime.now().toIso8601String(),
    };

    final response = await _supabase
        .from('payments')
        .update(updateData)
        .eq('id', id)
        .select()
        .single();
    return Payment.fromJson(response);
  }

  @override
  Future<String> initiateChapaPayment(ChapaPaymentRequest request) async {
    final dio = Dio();
    final chapaUrl = dotenv.get('CHAPA_API_URL');
    final chapaSecretKey = dotenv.get('CHAPA_SECRET_KEY');

    try {
      final response = await dio.post(
        chapaUrl,
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $chapaSecretKey',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final chapaResponse = ChapaPaymentResponse.fromJson(response.data);
        return chapaResponse.data.checkoutUrl;
      } else {
        throw Exception('Failed to initiate Chapa payment: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error initiating Chapa payment: $e');
    }
  }

  @override
  Future<void> processChapaWebhook(ChapaWebhookData webhookData) async {
    // Find payment by transaction reference
    final paymentResponse = await _supabase
        .from('payments')
        .select()
        .eq('transaction_id', webhookData.txRef)
        .single();

    if (paymentResponse.isEmpty) {
      throw Exception(
        'Payment not found for transaction: ${webhookData.txRef}',
      );
    }

    final payment = Payment.fromJson(paymentResponse);

    // Update payment status based on webhook
    PaymentStatus newStatus;
    switch (webhookData.status.toLowerCase()) {
      case 'success':
      case 'completed':
        newStatus = PaymentStatus.completed;
        break;
      case 'failed':
        newStatus = PaymentStatus.failed;
        break;
      case 'cancelled':
        newStatus = PaymentStatus.cancelled;
        break;
      default:
        newStatus = PaymentStatus.pending;
    }

    await updatePaymentStatus(payment.id, newStatus);

    // If payment completed, confirm the booking
    if (newStatus == PaymentStatus.completed) {
      await _supabase
          .from('bookings')
          .update({'status': 'confirmed'})
          .eq('id', payment.bookingId);
    }
  }
}
