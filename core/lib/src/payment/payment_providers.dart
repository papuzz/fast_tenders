import 'package:riverpod/riverpod.dart';
import 'payment_repo.dart';

// Payment Repository Provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return SupabasePaymentRepository();
});
