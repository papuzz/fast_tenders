import 'package:supabase_flutter/supabase_flutter.dart';
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
    // For now, return a mock checkout URL
    // TODO: Implement actual Chapa API integration
    final checkoutUrl = 'https://checkout.chapa.co/${request.txRef}';
    return checkoutUrl;
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
