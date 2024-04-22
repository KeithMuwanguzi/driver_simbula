import 'package:driver_simbula/config/bindings/pages.dart';
import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/authentication/login/presentation/login_page.dart';
import 'package:driver_simbula/shared/styles/common_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const LoginPage(),
      getPages: getPages,
    );
  }
}
