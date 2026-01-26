import 'package:core/src/network/supabase_client.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

enum AuthRole { user, admin }

/// Resolves the current user's effective role.
final authRoleProvider = FutureProvider<AuthRole>((ref) async {
  final supabase = SupabaseClientWrapper.client;
  final user = supabase.auth.currentUser;
  if (user == null) return AuthRole.user;

  try {
    final userRow = await supabase
        .from('profiles') // Using 'profiles' instead of 'users' to match our setup
        .select('is_pro')
        .eq('id', user.id)
        .maybeSingle();
    
    if (userRow != null && userRow['is_pro'] == true) {
      return AuthRole.admin;
    }
  } catch (e) {
    if (kDebugMode) print('authRoleProvider error: $e');
  }

  return AuthRole.user;
});