import 'package:riverpod/riverpod.dart';
import '../auth/user_provider.dart';
import '../models/notification.dart';
import 'notification_repo.dart';

// Notification Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return SupabaseNotificationRepository();
});

// Provider to fetch notifications for the current user
final notificationsProvider = FutureProvider<List<Notification>>((ref) async {
  final user = ref.watch(currentUserProvider).value;
  if (user == null) {
    return [];
  }
  final notificationRepo = ref.watch(notificationRepositoryProvider);
  return notificationRepo.getNotifications(user.id);
});

// Stream provider for real-time notifications
final notificationsStreamProvider =
    StreamProvider<List<Notification>>((ref) {
      final user = ref.watch(currentUserProvider).value;
      if (user == null) {
        return Stream.value([]);
      }
      final notificationRepo = ref.watch(notificationRepositoryProvider);
      return notificationRepo.streamNotifications(user.id);
    });
