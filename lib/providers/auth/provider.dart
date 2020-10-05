import 'package:flutter/material.dart';
import 'package:oraan/models/User.dart';
import 'package:oraan/providers/auth/repository.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;
  bool error = false;
  User user;

  Future<AuthProvider> login({String phone, String password}) async {
    this.loading = true;
    this.error = false;
    super.notifyListeners();

    final newUser =
        await AuthRepository.login(phone: phone, password: password);
    if (newUser != null) {
      this.user = newUser;
      this.loading = false;
    } else {
      this.loading = false;
      this.error = true;
    }
    notifyListeners();

    return this;
  }
}
