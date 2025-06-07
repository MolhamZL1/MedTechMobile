import 'package:dio/dio.dart';

import 'database_service.dart';

class ApiService implements DatabaseService {
  final Dio dio;

  ApiService({required this.dio});
  @override
  Future<void> addData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? rowid,
  }) async {
    if (rowid != null) {
      await dio.post(endpoint + rowid, data: data);
    } else {
      await dio.post(endpoint, data: data);
    }
  }

  @override
  Future getData({
    required String endpoint,
    String? rowid,
    Map<String, dynamic>? quary,
  }) async {
    if (rowid != null) {
      return await dio.get(endpoint + rowid);
    } else {
      return await dio.get(endpoint);
    }
  }
}
