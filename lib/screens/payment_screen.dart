import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../core/constants/app_colors.dart';
import 'package:fast_tenders/l10n/app_localizations.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final double amount;
  final String planId;
  final String planName;

  const PaymentScreen({
    super.key,
    required this.amount,
    required this.planId,
    required this.planName,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _startPayment() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = ref.read(authRepositoryProvider).currentUser;

      if (user == null) {
        throw Exception(l10n.userNotLoggedIn);
      }

      final email = user.email ?? '';
      final fullName = user.userMetadata?['full_name'] as String? ?? 'User';
      final txRef = 'TX-${const Uuid().v4()}';

      final request = ChapaPaymentRequest(
        amount: widget.amount,
        currency: 'ETB',
        email: email,
        firstName: fullName.split(' ').first,
        lastName: fullName.contains(' ') ? fullName.split(' ').last : '',
        txRef: txRef,
        callbackUrl:
            'https://webhook.site/placeholder', // Replace with your webhook
        returnUrl:
            'https://fasttenders.et/payment-success', // Replace with your return URL
        customizationTitle: 'Fast Tenders Subscription',
        customizationDescription: 'Payment for ${widget.planName}',
      );

      final paymentRepository = ref.read(paymentRepositoryProvider);
      final checkoutUrl =
          "http://checkout.chapa.co/checkout/web/payment/PL-Ys3weJRdMKb9";
      // await paymentRepository.initiateChapaPayment(request);

      final uri = Uri.parse(checkoutUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);

        if (mounted) {
          // After launching, we might want to show a message or wait for status
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.redirectingToChapa)),
          );
        }
      } else {
        throw Exception(l10n.couldNotLaunchPayment);
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.completePayment), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 64,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.planName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.amount} ETB',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ElevatedButton(
              onPressed: _isLoading ? null : _startPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      l10n.payNowWithChapa,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isLoading ? null : () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
