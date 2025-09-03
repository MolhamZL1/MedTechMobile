import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import '../model/profile_model.dart';
import '../../domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final DatabaseService databaseService;
  final String baseUrl;

  ProfileRepoImpl(this.databaseService, this.baseUrl);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final token = await databaseService.getToken(); 
     log("Token used for profile request: $token");

      final endpoint = '${baseUrl.replaceAll(RegExp(r'/$'),
       '')}/${BackendEndpoints.profile}';
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ProfileModel.fromJson(data);
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Failed to load profile');
    }
  }
}
