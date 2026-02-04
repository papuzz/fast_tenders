import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required String bookingId,
    required double amount,
    required String currency,
    required PaymentStatus status,
    String? transactionId,
    String? paymentUrl,
    String? callbackUrl,
    DateTime? completedAt,
    required DateTime createdAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
class ChapaPaymentRequest with _$ChapaPaymentRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapaPaymentRequest({
    required double amount,
    required String currency,
    required String email,
    required String firstName,
    String? lastName,
    String? phoneNumber,
    required String txRef,
    String? callbackUrl,
    String? returnUrl,
    String? customizationTitle,
    String? customizationDescription,
  }) = _ChapaPaymentRequest;

  factory ChapaPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$ChapaPaymentRequestFromJson(json);
}

@freezed
class ChapaPaymentResponse with _$ChapaPaymentResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapaPaymentResponse({
    required String message,
    required String status,
    required ChapaPaymentData data,
  }) = _ChapaPaymentResponse;

  factory ChapaPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapaPaymentResponseFromJson(json);
}

@freezed
class ChapaPaymentData with _$ChapaPaymentData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapaPaymentData({required String checkoutUrl}) =
      _ChapaPaymentData;

  factory ChapaPaymentData.fromJson(Map<String, dynamic> json) =>
      _$ChapaPaymentDataFromJson(json);
}

@freezed
class ChapaWebhookData with _$ChapaWebhookData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapaWebhookData({
    required String txRef,
    required String status,
  }) = _ChapaWebhookData;

  factory ChapaWebhookData.fromJson(Map<String, dynamic> json) =>
      _$ChapaWebhookDataFromJson(json);
}
