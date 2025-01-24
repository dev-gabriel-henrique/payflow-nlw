import 'package:flutter/material.dart';
import 'package:nlw_together/shared/auth/auth_controller.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull)),
        ],
      ),
    );
  }
}
