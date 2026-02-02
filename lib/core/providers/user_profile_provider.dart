import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:core/core.dart';

final userSectorsProvider = FutureProvider<List<String>>((ref) async {
  final user = ref.watch(currentUserProvider).value;
  if (user == null) return [];

  try {
    final profile = await Supabase.instance.client
        .from('business_profiles')
        .select('sectors')
        .eq('id', user.id)
        .maybeSingle();

    if (profile != null && profile['sectors'] != null) {
      return List<String>.from(profile['sectors']);
    }
  } catch (e) {
    // Return empty list on error
  }
  return [];
});
