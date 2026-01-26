import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientWrapper {
  static String? _url;

  static Future<void> initialize({
    required String url,
    required String anonKey,
  }) async {
    _url = url;
    await Supabase.initialize(url: url, anonKey: anonKey);
  }

  static SupabaseClient get client => Supabase.instance.client;

  /// Returns the URL passed at initialization or null if not initialized.
  static String? get url => _url;

  /// Functions base URL (e.g. `https://<project>.supabase.co/functions/v1`)
  static String? get functionsBaseUrl {
    final u = _url;
    if (u == null) return null;
    return '${u.replaceAll(RegExp(r'\/$'), '')}/functions/v1';
  }
}
