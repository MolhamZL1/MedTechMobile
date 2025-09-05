import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database_service.dart';

class ApiService implements DatabaseService {

 
  final Dio dio;
 static const String _tokenKey = 'token';

@override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
     // log("Token saved in prefs: $token");
      final savedToken = prefs.getString(_tokenKey); 
  log("✅ Token saved in SharedPreferences: $savedToken"); 
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }


  ApiService({required this.dio});
  @override
  Future addData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? rowid,
  }) async {
    if (rowid != null) {
      Response response = await dio.post(endpoint + rowid, data: data);
      return response.data;
    } else {
      Response response = await dio.post(endpoint, data: data);

      return response.data;
    }
  }

  @override
  Future getData({
    required String endpoint,
    String? rowid,
    Map<String, dynamic>? quary,
  }) async {
    if (rowid != null) {
      Response response = await dio.get(
        endpoint + rowid,
        queryParameters: quary,
      );
      return response.data;
    } else {
      Response response = await dio.get(endpoint, queryParameters: quary);
      return response.data;
    }
  }

  @override
  Future deleteData({required String endpoint, String? rowid}) async {
    if (rowid == null) {
      return await dio.delete(endpoint);
    }
    return await dio.delete(endpoint + rowid);
  }

  @override
  Future updateData({
    required String endpoint,
    String? rowid,
    Map<String, dynamic>? data,
  }) async {
    return await dio.put(endpoint + (rowid ?? ""), data: data);
  }
  


 
}
