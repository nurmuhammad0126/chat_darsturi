import 'dart:convert';

import 'package:chat_dasturi/features/authentication/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourece {
  final String _key = "user";

  Future<void> saved(AuthModel authModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = authModel.toJson();

      await prefs.setString(_key, jsonEncode(data));
    } catch (e) {
      print("\x1B[31m LocalDatabase saqlashda xatolik: $e  \x1B[0m");
    }
  }

  Future<AuthModel?> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_key);
      if (data == null) return null;
      final decodedData = jsonDecode(data);
      final AuthModel authModel = AuthModel.fromJson(decodedData);

      return authModel;
    } catch (e) {
      print("\x1B[31m LocalDatabase getData xatolik: $e  \x1B[0m");
      return null;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
      print("\x1B[32m Foydalanuvchi tizimdan chiqarildi \x1B[0m");
    } catch (e) {
      print("\x1B[31m LocalDatasource Logout xatolik: $e \x1B[0m");
    }
  }

}
