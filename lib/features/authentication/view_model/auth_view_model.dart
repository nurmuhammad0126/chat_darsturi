import 'package:chat_dasturi/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';

import '../data/repository/repository.dart';
import '../models/auth_model.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repo = AuthRepository();
  AuthModel? _authModel;
  UserModel? _userModel;
  bool _isLoading = false;

  AuthModel? get authModel => _authModel;
  UserModel? get userModel => _userModel;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Login
  Future<bool> login({required String email, required String password}) async {
    setLoading(true);
    final result = await _repo.login(email, password);
    setLoading(false);
    if (result != null) {
      _authModel = result;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Register
  Future<bool> register({
    required String email,
    required String password,
  }) async {
    final result = await _repo.register(email, password);
    if (result != null) {
      _authModel = result;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Parolni tiklash
  Future<bool> sendPasswordReset(String email) async {
    final res = await _repo.resetPassword(email);
    return res;
  }

  /// Logout
  Future<void> logout() async {
    await _repo.logout();
    _authModel = null;
    notifyListeners();
  }

  /// Refresh ID Token
  Future<void> refreshToken() async {
    final newToken = await _repo.refreshIdToken();
    if (newToken != null) {
      final user = await _repo.getCurrentUser();
      _authModel = user;
      notifyListeners();
    }
  }

  /// Mahalliy userni olish
  Future<void> loadUser() async {
    _authModel = await _repo.getCurrentUser();
    notifyListeners();
  }

  Future<UserModel?> getUserModel() async {
    final user = await _repo.getUserModel();
    return user;
  }

  Future<void> saveUserModel(UserModel user) async {
    await _repo.saveUserModel(user);
    _userModel = user;
  }
}
