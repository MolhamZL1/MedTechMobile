import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medtech_mobile/core/services/local_storage_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/profile/data/model/profile_model.dart';

class ProfileRepo {
  Future<ProfileModel> getProfile() async {
  
    final token = await LocalStorageService.getItem(LocalStorageKeys.token);

    if (token == null) {
      throw Exception("No token found, please login again.");
    }

    final response = await http.get(
      Uri.parse( BackendEndpoints.profile),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProfileModel.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized: Invalid or expired token");
    } else {
      throw Exception("Failed to load profile: ${response.statusCode}");
    }
  }
}
