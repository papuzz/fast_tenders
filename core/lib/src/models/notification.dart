import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

enum NotificationType {
  @JsonValue('booking_confirmed')
  bookingConfirmed,
  @JsonValue('booking_cancelled')
  bookingCancelled,
  @JsonValue('booking_reminder')
  bookingReminder,
  @JsonValue('payment_success')
  paymentSuccess,
  @JsonValue('tender_match')
  tenderMatch,
  @JsonValue('general')
  general,
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'tender_id') String? tenderId,
    required String title,
    required String message,
    required NotificationType type,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
