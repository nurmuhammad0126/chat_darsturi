import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/auth_model.dart';

class RemoteDatasource {
  static const String _apiKey = 'AIzaSyAp1aeWZYzQ86i22dmXf21GbjzL8gnSLWc';
  static const String _signUpUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey";

  Future<AuthModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_signUpUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return AuthModel.fromJson(data);
      } else {
        final error = json.decode(response.body);
        throw Exception(error['error']['message']);
      }
    } catch (e) {
      print("\x1B[31m Ro'yxatdan o'tishda xatolik: $e  \x1B[0m");
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_apiKey',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'requestType': 'PASSWORD_RESET', 'email': email}),
      );

      if (response.statusCode == 200) {
        print("\x1B[32m Parolni tiklash linki yuborildi! \x1B[0m");
        return true;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['error']['message']);
      }
    } catch (e) {
      print("\x1B[31m Parol tiklashda xatolik: $e \x1B[0m");
      return false;
    }
  }

  Future<AuthModel?> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apiKey',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return AuthModel.fromJson(data);
      } else {
        final error = json.decode(response.body);
        throw Exception(error['error']['message']);
      }
    } catch (e) {
      print("\x1B[31m Ro'yxatdan o'tishda xatolik: $e \x1B[0m");
      return null;
    }
  }
}
