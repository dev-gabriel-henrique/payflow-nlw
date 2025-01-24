import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_together/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw_together/modules/home/home_page.dart';
import 'package:nlw_together/modules/insert_boleto/insert_boleto_page.dart';
import 'package:nlw_together/modules/login/login_page.dart';
import 'package:nlw_together/modules/splash/splash_page.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: Appcolors.primary,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        useMaterial3: true,
      ),
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/barcode_scanner": (context) => const BarcodeScannerPage(),
        "/insert_boleto": (context) => const InsertBoletoPage()
      },
    );
  }
}
