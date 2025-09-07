import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'database_service.dart';

class ApiService implements DatabaseService {
  final Dio dio;

  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: BackendEndpoints.url,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');

          final p = options.path;
          final isAuthCall =
              p.contains('/auth/login') ||
              p.contains('/auth/register') ||
              p.contains('/auth/refresh');

          if (!isAuthCall &&
              token != null &&
              token.isNotEmpty &&
              options.headers['Authorization'] == null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  @override
  Future addData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? rowid,
  }) async {
    final Response res = await dio.post(endpoint + (rowid ?? ''), data: data);
    return res.data;
  }

  @override
  Future getData({
    required String endpoint,
    String? rowid,
    Map<String, dynamic>? quary,
  }) async {
    final Response res = await dio.get(
      endpoint + (rowid ?? ''),
      queryParameters: quary,
    );
    return res.data;
  }

  @override
  Future deleteData({required String endpoint, String? rowid}) async {
    final Response res = await dio.delete(endpoint + (rowid ?? ''));
    return res.data;
  }

  @override
  Future updateData({
    required String endpoint,
    String? rowid,
    dynamic data,
  }) async {
    final Response res = await dio.put(endpoint + (rowid ?? ''), data: data);
    return res.data;
  }
}
