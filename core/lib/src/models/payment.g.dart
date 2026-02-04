// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      bookingId: json['bookingId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      transactionId: json['transactionId'] as String?,
      paymentUrl: json['paymentUrl'] as String?,
      callbackUrl: json['callbackUrl'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'transactionId': instance.transactionId,
      'paymentUrl': instance.paymentUrl,
      'callbackUrl': instance.callbackUrl,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.completed: 'completed',
  PaymentStatus.failed: 'failed',
  PaymentStatus.cancelled: 'cancelled',
};

_$ChapaPaymentRequestImpl _$$ChapaPaymentRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChapaPaymentRequestImpl(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String?,
  phoneNumber: json['phone_number'] as String?,
  txRef: json['tx_ref'] as String,
  callbackUrl: json['callback_url'] as String?,
  returnUrl: json['return_url'] as String?,
  customizationTitle: json['customization_title'] as String?,
  customizationDescription: json['customization_description'] as String?,
);

Map<String, dynamic> _$$ChapaPaymentRequestImplToJson(
  _$ChapaPaymentRequestImpl instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'tx_ref': instance.txRef,
  'callback_url': instance.callbackUrl,
  'return_url': instance.returnUrl,
  'customization_title': instance.customizationTitle,
  'customization_description': instance.customizationDescription,
};

_$ChapaPaymentResponseImpl _$$ChapaPaymentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChapaPaymentResponseImpl(
  message: json['message'] as String,
  status: json['status'] as String,
  data: ChapaPaymentData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ChapaPaymentResponseImplToJson(
  _$ChapaPaymentResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};

_$ChapaPaymentDataImpl _$$ChapaPaymentDataImplFromJson(
  Map<String, dynamic> json,
) => _$ChapaPaymentDataImpl(checkoutUrl: json['checkout_url'] as String);

Map<String, dynamic> _$$ChapaPaymentDataImplToJson(
  _$ChapaPaymentDataImpl instance,
) => <String, dynamic>{'checkout_url': instance.checkoutUrl};

_$ChapaWebhookDataImpl _$$ChapaWebhookDataImplFromJson(
  Map<String, dynamic> json,
) => _$ChapaWebhookDataImpl(
  txRef: json['tx_ref'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$ChapaWebhookDataImplToJson(
  _$ChapaWebhookDataImpl instance,
) => <String, dynamic>{'tx_ref': instance.txRef, 'status': instance.status};
