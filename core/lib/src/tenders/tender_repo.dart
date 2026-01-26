import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/tender.dart';
import 'package:riverpod/riverpod.dart';

abstract class TenderRepository {
  Future<List<Tender>> getTenders();
  Future<Tender?> getTender(String id);
}

class SupabaseTenderRepository implements TenderRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<List<Tender>> getTenders() async {
    final response = await _supabase
        .from('tenders')
        .select()
        .order('posted_date', ascending: false);
    return (response as List).map((json) => Tender.fromJson(json)).toList();
  }

  @override
  Future<Tender?> getTender(String id) async {
    final response = await _supabase
        .from('tenders')
        .select()
        .eq('id', id)
        .maybeSingle();
    if (response == null) return null;
    return Tender.fromJson(response);
  }
}

final tenderRepositoryProvider = Provider<TenderRepository>((ref) {
  return SupabaseTenderRepository();
});
