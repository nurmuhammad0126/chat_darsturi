import 'dart:convert';

import '../../models/auth_model.dart';
import '../datasources/local_datasourece.dart';
import '../datasources/remote_datasource.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final LocalDatasourece local = LocalDatasourece();
  final RemoteDatasource remote = RemoteDatasource();
  static const String _apiKey = 'AIzaSyAp1aeWZYzQ86i22dmXf21GbjzL8gnSLWc';

  Future<String?> refreshIdToken() async {
    try {
      final user = await local.getData();
      if (user == null) throw Exception('Token topilmadi');

      final response = await http.post(
        Uri.parse('https://securetoken.googleapis.com/v1/token?key=$_apiKey'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': user.refreshToken,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newIdToken = data['idToken'];
        final newRefreshToken = data['refreshToken'];
        final newExpiresIn = data['expiresIn'];
        final localId = data['localId'];

        final updatedUser = AuthModel(
          idToken: newIdToken,
          email: user.email,
          refreshToken: newRefreshToken,
          expiresIn: newExpiresIn,
          localId: localId,
        );

        await local.saved(updatedUser);
        print("\x1B[32m Token yangilandi: $newIdToken \x1B[0m");
        return newIdToken;
      } else {
        final err = jsonDecode(response.body);
        throw Exception(err['error']['message']);
      }
    } catch (e) {
      print("\x1B[31m Token yangilashda xatolik: $e \x1B[0m");
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    return await remote.resetPassword(email);
  }

  Future<AuthModel?> login(String email, String password) async {
    final authModel = await remote.login(email, password);
    if (authModel != null) {
      await local.saved(authModel);
    }
    return authModel;
  }

  Future<void> logout() async {
    await local.logout();
  }

  Future<AuthModel?> getCurrentUser() async {
    return await local.getData();
  }

  Future<AuthModel?> register(String email, String password) async {
  final authModel = await remote.register(email, password);
  if (authModel != null) {
    await local.saved(authModel);
  }
  return authModel;
}

}
