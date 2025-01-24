import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_together/shared/auth/auth_controller.dart';
import 'package:nlw_together/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await googleSignIn.signIn();

      final user = UserModel(
        name: response?.displayName ?? "",
        photoURL: response?.photoUrl,
      );

      if (!context.mounted) return;
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
      debugPrint(error.toString());
    }
  }
}
