// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String get id => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PaymentStatus get status => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get paymentUrl => throw _privateConstructorUsedError;
  String? get callbackUrl => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call({
    String id,
    String bookingId,
    double amount,
    String currency,
    PaymentStatus status,
    String? transactionId,
    String? paymentUrl,
    String? callbackUrl,
    DateTime? completedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paymentUrl = freezed,
    Object? callbackUrl = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            bookingId: null == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PaymentStatus,
            transactionId: freezed == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentUrl: freezed == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            callbackUrl: freezed == callbackUrl
                ? _value.callbackUrl
                : callbackUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
    _$PaymentImpl value,
    $Res Function(_$PaymentImpl) then,
  ) = __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String bookingId,
    double amount,
    String currency,
    PaymentStatus status,
    String? transactionId,
    String? paymentUrl,
    String? callbackUrl,
    DateTime? completedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
    _$PaymentImpl _value,
    $Res Function(_$PaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paymentUrl = freezed,
    Object? callbackUrl = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$PaymentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bookingId: null == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PaymentStatus,
        transactionId: freezed == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentUrl: freezed == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        callbackUrl: freezed == callbackUrl
            ? _value.callbackUrl
            : callbackUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl({
    required this.id,
    required this.bookingId,
    required this.amount,
    required this.currency,
    required this.status,
    this.transactionId,
    this.paymentUrl,
    this.callbackUrl,
    this.completedAt,
    required this.createdAt,
  });

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final String id;
  @override
  final String bookingId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final PaymentStatus status;
  @override
  final String? transactionId;
  @override
  final String? paymentUrl;
  @override
  final String? callbackUrl;
  @override
  final DateTime? completedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Payment(id: $id, bookingId: $bookingId, amount: $amount, currency: $currency, status: $status, transactionId: $transactionId, paymentUrl: $paymentUrl, callbackUrl: $callbackUrl, completedAt: $completedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.callbackUrl, callbackUrl) ||
                other.callbackUrl == callbackUrl) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bookingId,
    amount,
    currency,
    status,
    transactionId,
    paymentUrl,
    callbackUrl,
    completedAt,
    createdAt,
  );

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment({
    required final String id,
    required final String bookingId,
    required final double amount,
    required final String currency,
    required final PaymentStatus status,
    final String? transactionId,
    final String? paymentUrl,
    final String? callbackUrl,
    final DateTime? completedAt,
    required final DateTime createdAt,
  }) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  String get id;
  @override
  String get bookingId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  PaymentStatus get status;
  @override
  String? get transactionId;
  @override
  String? get paymentUrl;
  @override
  String? get callbackUrl;
  @override
  DateTime? get completedAt;
  @override
  DateTime get createdAt;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapaPaymentRequest _$ChapaPaymentRequestFromJson(Map<String, dynamic> json) {
  return _ChapaPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$ChapaPaymentRequest {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String get txRef => throw _privateConstructorUsedError;
  String? get callbackUrl => throw _privateConstructorUsedError;
  String? get returnUrl => throw _privateConstructorUsedError;
  String? get customizationTitle => throw _privateConstructorUsedError;
  String? get customizationDescription => throw _privateConstructorUsedError;

  /// Serializes this ChapaPaymentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapaPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapaPaymentRequestCopyWith<ChapaPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapaPaymentRequestCopyWith<$Res> {
  factory $ChapaPaymentRequestCopyWith(
    ChapaPaymentRequest value,
    $Res Function(ChapaPaymentRequest) then,
  ) = _$ChapaPaymentRequestCopyWithImpl<$Res, ChapaPaymentRequest>;
  @useResult
  $Res call({
    double amount,
    String currency,
    String email,
    String firstName,
    String? lastName,
    String? phoneNumber,
    String txRef,
    String? callbackUrl,
    String? returnUrl,
    String? customizationTitle,
    String? customizationDescription,
  });
}

/// @nodoc
class _$ChapaPaymentRequestCopyWithImpl<$Res, $Val extends ChapaPaymentRequest>
    implements $ChapaPaymentRequestCopyWith<$Res> {
  _$ChapaPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapaPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? txRef = null,
    Object? callbackUrl = freezed,
    Object? returnUrl = freezed,
    Object? customizationTitle = freezed,
    Object? customizationDescription = freezed,
  }) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            txRef: null == txRef
                ? _value.txRef
                : txRef // ignore: cast_nullable_to_non_nullable
                      as String,
            callbackUrl: freezed == callbackUrl
                ? _value.callbackUrl
                : callbackUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            returnUrl: freezed == returnUrl
                ? _value.returnUrl
                : returnUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            customizationTitle: freezed == customizationTitle
                ? _value.customizationTitle
                : customizationTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            customizationDescription: freezed == customizationDescription
                ? _value.customizationDescription
                : customizationDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapaPaymentRequestImplCopyWith<$Res>
    implements $ChapaPaymentRequestCopyWith<$Res> {
  factory _$$ChapaPaymentRequestImplCopyWith(
    _$ChapaPaymentRequestImpl value,
    $Res Function(_$ChapaPaymentRequestImpl) then,
  ) = __$$ChapaPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double amount,
    String currency,
    String email,
    String firstName,
    String? lastName,
    String? phoneNumber,
    String txRef,
    String? callbackUrl,
    String? returnUrl,
    String? customizationTitle,
    String? customizationDescription,
  });
}

/// @nodoc
class __$$ChapaPaymentRequestImplCopyWithImpl<$Res>
    extends _$ChapaPaymentRequestCopyWithImpl<$Res, _$ChapaPaymentRequestImpl>
    implements _$$ChapaPaymentRequestImplCopyWith<$Res> {
  __$$ChapaPaymentRequestImplCopyWithImpl(
    _$ChapaPaymentRequestImpl _value,
    $Res Function(_$ChapaPaymentRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapaPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? txRef = null,
    Object? callbackUrl = freezed,
    Object? returnUrl = freezed,
    Object? customizationTitle = freezed,
    Object? customizationDescription = freezed,
  }) {
    return _then(
      _$ChapaPaymentRequestImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        txRef: null == txRef
            ? _value.txRef
            : txRef // ignore: cast_nullable_to_non_nullable
                  as String,
        callbackUrl: freezed == callbackUrl
            ? _value.callbackUrl
            : callbackUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        returnUrl: freezed == returnUrl
            ? _value.returnUrl
            : returnUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        customizationTitle: freezed == customizationTitle
            ? _value.customizationTitle
            : customizationTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        customizationDescription: freezed == customizationDescription
            ? _value.customizationDescription
            : customizationDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapaPaymentRequestImpl implements _ChapaPaymentRequest {
  const _$ChapaPaymentRequestImpl({
    required this.amount,
    required this.currency,
    required this.email,
    required this.firstName,
    this.lastName,
    this.phoneNumber,
    required this.txRef,
    this.callbackUrl,
    this.returnUrl,
    this.customizationTitle,
    this.customizationDescription,
  });

  factory _$ChapaPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapaPaymentRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String currency;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  final String txRef;
  @override
  final String? callbackUrl;
  @override
  final String? returnUrl;
  @override
  final String? customizationTitle;
  @override
  final String? customizationDescription;

  @override
  String toString() {
    return 'ChapaPaymentRequest(amount: $amount, currency: $currency, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, txRef: $txRef, callbackUrl: $callbackUrl, returnUrl: $returnUrl, customizationTitle: $customizationTitle, customizationDescription: $customizationDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapaPaymentRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.txRef, txRef) || other.txRef == txRef) &&
            (identical(other.callbackUrl, callbackUrl) ||
                other.callbackUrl == callbackUrl) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl) &&
            (identical(other.customizationTitle, customizationTitle) ||
                other.customizationTitle == customizationTitle) &&
            (identical(
                  other.customizationDescription,
                  customizationDescription,
                ) ||
                other.customizationDescription == customizationDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    amount,
    currency,
    email,
    firstName,
    lastName,
    phoneNumber,
    txRef,
    callbackUrl,
    returnUrl,
    customizationTitle,
    customizationDescription,
  );

  /// Create a copy of ChapaPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapaPaymentRequestImplCopyWith<_$ChapaPaymentRequestImpl> get copyWith =>
      __$$ChapaPaymentRequestImplCopyWithImpl<_$ChapaPaymentRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapaPaymentRequestImplToJson(this);
  }
}

abstract class _ChapaPaymentRequest implements ChapaPaymentRequest {
  const factory _ChapaPaymentRequest({
    required final double amount,
    required final String currency,
    required final String email,
    required final String firstName,
    final String? lastName,
    final String? phoneNumber,
    required final String txRef,
    final String? callbackUrl,
    final String? returnUrl,
    final String? customizationTitle,
    final String? customizationDescription,
  }) = _$ChapaPaymentRequestImpl;

  factory _ChapaPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$ChapaPaymentRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get currency;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String? get lastName;
  @override
  String? get phoneNumber;
  @override
  String get txRef;
  @override
  String? get callbackUrl;
  @override
  String? get returnUrl;
  @override
  String? get customizationTitle;
  @override
  String? get customizationDescription;

  /// Create a copy of ChapaPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapaPaymentRequestImplCopyWith<_$ChapaPaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapaPaymentResponse _$ChapaPaymentResponseFromJson(Map<String, dynamic> json) {
  return _ChapaPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$ChapaPaymentResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  ChapaPaymentData get data => throw _privateConstructorUsedError;

  /// Serializes this ChapaPaymentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapaPaymentResponseCopyWith<ChapaPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapaPaymentResponseCopyWith<$Res> {
  factory $ChapaPaymentResponseCopyWith(
    ChapaPaymentResponse value,
    $Res Function(ChapaPaymentResponse) then,
  ) = _$ChapaPaymentResponseCopyWithImpl<$Res, ChapaPaymentResponse>;
  @useResult
  $Res call({String message, String status, ChapaPaymentData data});

  $ChapaPaymentDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ChapaPaymentResponseCopyWithImpl<
  $Res,
  $Val extends ChapaPaymentResponse
>
    implements $ChapaPaymentResponseCopyWith<$Res> {
  _$ChapaPaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ChapaPaymentData,
          )
          as $Val,
    );
  }

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChapaPaymentDataCopyWith<$Res> get data {
    return $ChapaPaymentDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChapaPaymentResponseImplCopyWith<$Res>
    implements $ChapaPaymentResponseCopyWith<$Res> {
  factory _$$ChapaPaymentResponseImplCopyWith(
    _$ChapaPaymentResponseImpl value,
    $Res Function(_$ChapaPaymentResponseImpl) then,
  ) = __$$ChapaPaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String status, ChapaPaymentData data});

  @override
  $ChapaPaymentDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ChapaPaymentResponseImplCopyWithImpl<$Res>
    extends _$ChapaPaymentResponseCopyWithImpl<$Res, _$ChapaPaymentResponseImpl>
    implements _$$ChapaPaymentResponseImplCopyWith<$Res> {
  __$$ChapaPaymentResponseImplCopyWithImpl(
    _$ChapaPaymentResponseImpl _value,
    $Res Function(_$ChapaPaymentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? data = null,
  }) {
    return _then(
      _$ChapaPaymentResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ChapaPaymentData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapaPaymentResponseImpl implements _ChapaPaymentResponse {
  const _$ChapaPaymentResponseImpl({
    required this.message,
    required this.status,
    required this.data,
  });

  factory _$ChapaPaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapaPaymentResponseImplFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final ChapaPaymentData data;

  @override
  String toString() {
    return 'ChapaPaymentResponse(message: $message, status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapaPaymentResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapaPaymentResponseImplCopyWith<_$ChapaPaymentResponseImpl>
  get copyWith =>
      __$$ChapaPaymentResponseImplCopyWithImpl<_$ChapaPaymentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapaPaymentResponseImplToJson(this);
  }
}

abstract class _ChapaPaymentResponse implements ChapaPaymentResponse {
  const factory _ChapaPaymentResponse({
    required final String message,
    required final String status,
    required final ChapaPaymentData data,
  }) = _$ChapaPaymentResponseImpl;

  factory _ChapaPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$ChapaPaymentResponseImpl.fromJson;

  @override
  String get message;
  @override
  String get status;
  @override
  ChapaPaymentData get data;

  /// Create a copy of ChapaPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapaPaymentResponseImplCopyWith<_$ChapaPaymentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ChapaPaymentData _$ChapaPaymentDataFromJson(Map<String, dynamic> json) {
  return _ChapaPaymentData.fromJson(json);
}

/// @nodoc
mixin _$ChapaPaymentData {
  String get checkoutUrl => throw _privateConstructorUsedError;

  /// Serializes this ChapaPaymentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapaPaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapaPaymentDataCopyWith<ChapaPaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapaPaymentDataCopyWith<$Res> {
  factory $ChapaPaymentDataCopyWith(
    ChapaPaymentData value,
    $Res Function(ChapaPaymentData) then,
  ) = _$ChapaPaymentDataCopyWithImpl<$Res, ChapaPaymentData>;
  @useResult
  $Res call({String checkoutUrl});
}

/// @nodoc
class _$ChapaPaymentDataCopyWithImpl<$Res, $Val extends ChapaPaymentData>
    implements $ChapaPaymentDataCopyWith<$Res> {
  _$ChapaPaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapaPaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkoutUrl = null}) {
    return _then(
      _value.copyWith(
            checkoutUrl: null == checkoutUrl
                ? _value.checkoutUrl
                : checkoutUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapaPaymentDataImplCopyWith<$Res>
    implements $ChapaPaymentDataCopyWith<$Res> {
  factory _$$ChapaPaymentDataImplCopyWith(
    _$ChapaPaymentDataImpl value,
    $Res Function(_$ChapaPaymentDataImpl) then,
  ) = __$$ChapaPaymentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String checkoutUrl});
}

/// @nodoc
class __$$ChapaPaymentDataImplCopyWithImpl<$Res>
    extends _$ChapaPaymentDataCopyWithImpl<$Res, _$ChapaPaymentDataImpl>
    implements _$$ChapaPaymentDataImplCopyWith<$Res> {
  __$$ChapaPaymentDataImplCopyWithImpl(
    _$ChapaPaymentDataImpl _value,
    $Res Function(_$ChapaPaymentDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapaPaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkoutUrl = null}) {
    return _then(
      _$ChapaPaymentDataImpl(
        checkoutUrl: null == checkoutUrl
            ? _value.checkoutUrl
            : checkoutUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapaPaymentDataImpl implements _ChapaPaymentData {
  const _$ChapaPaymentDataImpl({required this.checkoutUrl});

  factory _$ChapaPaymentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapaPaymentDataImplFromJson(json);

  @override
  final String checkoutUrl;

  @override
  String toString() {
    return 'ChapaPaymentData(checkoutUrl: $checkoutUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapaPaymentDataImpl &&
            (identical(other.checkoutUrl, checkoutUrl) ||
                other.checkoutUrl == checkoutUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, checkoutUrl);

  /// Create a copy of ChapaPaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapaPaymentDataImplCopyWith<_$ChapaPaymentDataImpl> get copyWith =>
      __$$ChapaPaymentDataImplCopyWithImpl<_$ChapaPaymentDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapaPaymentDataImplToJson(this);
  }
}

abstract class _ChapaPaymentData implements ChapaPaymentData {
  const factory _ChapaPaymentData({required final String checkoutUrl}) =
      _$ChapaPaymentDataImpl;

  factory _ChapaPaymentData.fromJson(Map<String, dynamic> json) =
      _$ChapaPaymentDataImpl.fromJson;

  @override
  String get checkoutUrl;

  /// Create a copy of ChapaPaymentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapaPaymentDataImplCopyWith<_$ChapaPaymentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapaWebhookData _$ChapaWebhookDataFromJson(Map<String, dynamic> json) {
  return _ChapaWebhookData.fromJson(json);
}

/// @nodoc
mixin _$ChapaWebhookData {
  String get txRef => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this ChapaWebhookData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapaWebhookData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapaWebhookDataCopyWith<ChapaWebhookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapaWebhookDataCopyWith<$Res> {
  factory $ChapaWebhookDataCopyWith(
    ChapaWebhookData value,
    $Res Function(ChapaWebhookData) then,
  ) = _$ChapaWebhookDataCopyWithImpl<$Res, ChapaWebhookData>;
  @useResult
  $Res call({String txRef, String status});
}

/// @nodoc
class _$ChapaWebhookDataCopyWithImpl<$Res, $Val extends ChapaWebhookData>
    implements $ChapaWebhookDataCopyWith<$Res> {
  _$ChapaWebhookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapaWebhookData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? txRef = null, Object? status = null}) {
    return _then(
      _value.copyWith(
            txRef: null == txRef
                ? _value.txRef
                : txRef // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapaWebhookDataImplCopyWith<$Res>
    implements $ChapaWebhookDataCopyWith<$Res> {
  factory _$$ChapaWebhookDataImplCopyWith(
    _$ChapaWebhookDataImpl value,
    $Res Function(_$ChapaWebhookDataImpl) then,
  ) = __$$ChapaWebhookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txRef, String status});
}

/// @nodoc
class __$$ChapaWebhookDataImplCopyWithImpl<$Res>
    extends _$ChapaWebhookDataCopyWithImpl<$Res, _$ChapaWebhookDataImpl>
    implements _$$ChapaWebhookDataImplCopyWith<$Res> {
  __$$ChapaWebhookDataImplCopyWithImpl(
    _$ChapaWebhookDataImpl _value,
    $Res Function(_$ChapaWebhookDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapaWebhookData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? txRef = null, Object? status = null}) {
    return _then(
      _$ChapaWebhookDataImpl(
        txRef: null == txRef
            ? _value.txRef
            : txRef // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapaWebhookDataImpl implements _ChapaWebhookData {
  const _$ChapaWebhookDataImpl({required this.txRef, required this.status});

  factory _$ChapaWebhookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapaWebhookDataImplFromJson(json);

  @override
  final String txRef;
  @override
  final String status;

  @override
  String toString() {
    return 'ChapaWebhookData(txRef: $txRef, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapaWebhookDataImpl &&
            (identical(other.txRef, txRef) || other.txRef == txRef) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, txRef, status);

  /// Create a copy of ChapaWebhookData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapaWebhookDataImplCopyWith<_$ChapaWebhookDataImpl> get copyWith =>
      __$$ChapaWebhookDataImplCopyWithImpl<_$ChapaWebhookDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapaWebhookDataImplToJson(this);
  }
}

abstract class _ChapaWebhookData implements ChapaWebhookData {
  const factory _ChapaWebhookData({
    required final String txRef,
    required final String status,
  }) = _$ChapaWebhookDataImpl;

  factory _ChapaWebhookData.fromJson(Map<String, dynamic> json) =
      _$ChapaWebhookDataImpl.fromJson;

  @override
  String get txRef;
  @override
  String get status;

  /// Create a copy of ChapaWebhookData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapaWebhookDataImplCopyWith<_$ChapaWebhookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
