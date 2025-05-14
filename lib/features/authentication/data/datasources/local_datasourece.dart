import 'dart:convert';

import 'package:chat_dasturi/features/authentication/models/auth_model.dart';
import 'package:chat_dasturi/features/authentication/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourece {
  final String _authKey = "authModel";
  final String _userKey = "userModel";


  Future<void> saved(AuthModel authModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = authModel.toJson();

      await prefs.setString(_authKey, jsonEncode(data));
    } catch (e) {
      print("\x1B[31m LocalDatabase saqlashda xatolik: $e  \x1B[0m");
    }
  }

  Future<AuthModel?> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_authKey);
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
      await prefs.remove(_authKey);
      print("\x1B[32m Foydalanuvchi tizimdan chiqarildi \x1B[0m");
    } catch (e) {
      print("\x1B[31m LocalDatasource Logout xatolik: $e \x1B[0m");
    }
  }

   Future<UserModel?> getUserModel() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_userKey);
      if (data == null) return null;
      final decodedData = jsonDecode(data);
      final UserModel userModel = UserModel.fromJson(decodedData);

      return userModel;
    } catch (e) {
      print("\x1B[31m LocalDatabase getUserModelda xatolik: $e  \x1B[0m");
      return null;
    }
  }

  Future<void> savedUser(UserModel userModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = userModel.toJson();

      await prefs.setString(_userKey, jsonEncode(data));
    } catch (e) {
      print("\x1B[31m LocalDatabase USermodel saqlashda xatolik: $e  \x1B[0m");
    }
  }
}
