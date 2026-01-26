import 'package:dio/dio.dart';
import 'package:core/src/network/supabase_client.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    final urlbase = 'https://sqbqjagpflsynyzbpbtg.supabase.co';

    _dio = Dio(
      BaseOptions(
        baseUrl: urlbase,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final session = SupabaseClientWrapper.client.auth.currentSession;
          if (session != null) {
            options.headers['Authorization'] = 'Bearer ${session.accessToken}';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle errors
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
