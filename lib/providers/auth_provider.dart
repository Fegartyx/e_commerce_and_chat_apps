import 'package:e_commerce_and_chat_apps/models/user_model.dart';
import 'package:e_commerce_and_chat_apps/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
    String name,
    String username,
    String email,
    String password,
  ) async {
    try {
      UserModel user = await AuthService().register(
          email: email, name: name, password: password, username: username);
      _user = user;
      return true;
    } catch (e) {
      print('Error $e where $email $name $password $username');
      return false;
    }
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print('Error $e where $email $password');
      return false;
    }
  }
}
