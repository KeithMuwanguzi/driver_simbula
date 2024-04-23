import 'package:driver_simbula/config/bindings/pages.dart';
import 'package:driver_simbula/config/database/firebase_services.dart';
import 'package:driver_simbula/firebase_options.dart';
import 'package:driver_simbula/shared/styles/common_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(
      AuthController(),
    ),
  );
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
      getPages: getPages,
      initialRoute: "/login",
    );
  }
}
