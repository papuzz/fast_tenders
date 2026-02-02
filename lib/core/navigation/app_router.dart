import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'package:fast_tenders/screens/feed_screen.dart';
import 'package:fast_tenders/screens/profile_screen.dart';
import 'package:fast_tenders/screens/login_screen.dart';
import 'package:fast_tenders/screens/signup_screen.dart';
import 'package:fast_tenders/screens/forgot_password_screen.dart';
import 'package:fast_tenders/screens/tender_detail_screen.dart';
import 'package:fast_tenders/screens/buisness_profile_screen.dart';
import 'package:fast_tenders/screens/notification_screen.dart';
import 'package:fast_tenders/screens/saved_tenders_screen.dart';
import 'package:fast_tenders/screens/generic_tender_list_screen.dart';
import 'package:fast_tenders/screens/membership_selection_screen.dart';
import 'package:fast_tenders/screens/industry_alerts_screen.dart';
import 'package:fast_tenders/screens/corporate_team_management_screen.dart';
import 'package:core/core.dart';

import '../../l10n/app_localizations.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AuthRefreshListenable extends ChangeNotifier {
  AuthRefreshListenable(Stream<AuthState> authStateChanges) {
    _subscription = authStateChanges.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final authRefreshListenableProvider = Provider<AuthRefreshListenable>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthRefreshListenable(authRepository.authStateChanges);
});

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final refreshListenable = ref.watch(authRefreshListenableProvider);

  return GoRouter(
    initialLocation: '/feed',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final isAuthRoute =
          state.uri.toString() == '/login' ||
          state.uri.toString() == '/signup' ||
          state.uri.toString() == '/forgot-password';

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }
      if (isLoggedIn && isAuthRoute) {
        return '/feed';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/membership',
        builder: (context, state) => const MembershipSelectionScreen(),
      ),
      GoRoute(
        path: '/corporate-team',
        builder: (context, state) => const CorporateTeamManagementScreen(),
      ),
      GoRoute(
        path: '/industry-alerts',
        builder: (context, state) => const IndustryAlertsScreen(),
      ),
      GoRoute(
        path: '/business-profile',
        builder: (context, state) {
          final step = state.uri.queryParameters['step'];
          final initialStep = step != null ? int.tryParse(step) ?? 0 : 0;
          return BusinessProfileScreen(initialStep: initialStep);
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: '/saved-tenders',
        builder: (context, state) => const SavedTendersScreen(),
      ),
      GoRoute(
        path: '/free-tenders',
        builder: (context, state) => GenericTenderListScreen(
          type: TenderListType.freeTenders,
          title: AppLocalizations.of(context)!.drawerFreeTenders,
        ),
      ),
      GoRoute(
        path: '/unread-tenders',
        builder: (context, state) => GenericTenderListScreen(
          type: TenderListType.unread,
          title: AppLocalizations.of(context)!.drawerUnread,
        ),
      ),
      GoRoute(
        path: '/trashed-tenders',
        builder: (context, state) => GenericTenderListScreen(
          type: TenderListType.trashed,
          title: AppLocalizations.of(context)!.drawerTrashed,
        ),
      ),
      GoRoute(
        path: '/tender-details',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final tenders = extra['tenders'] as List<Tender>;
          final initialIndex = extra['initialIndex'] as int;
          return TenderDetailScreen(
            tenders: tenders,
            initialIndex: initialIndex,
          );
        },
      ),
      // Stateful Navigation for Bottom Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/feed',
                builder: (context, state) => const TenderScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-tenders',
                builder: (context, state) => GenericTenderListScreen(
                  type: TenderListType.myTenders,
                  title: AppLocalizations.of(context)!.drawerMyTenders,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: AppLocalizations.of(context)!.navBrowse,
          ),
          NavigationDestination(
            icon: const Icon(Icons.assignment_outlined),
            label: AppLocalizations.of(context)!.drawerMyTenders,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.navProfile,
          ),
        ],
      ),
    );
  }
}
