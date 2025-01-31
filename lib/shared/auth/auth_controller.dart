import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(
        context,
        "/login",
      );
    }
  }

  Future<void> saveUser(UserModel? user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user!.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.getString("user") as String;

      if (!context.mounted) return;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      if (!context.mounted) return;
      setUser(context, null);
    }
  }
}
