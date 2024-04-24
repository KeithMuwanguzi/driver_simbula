import 'package:driver_simbula/config/bindings/login_binding.dart';
import 'package:driver_simbula/config/bindings/signup_binding.dart';
import 'package:driver_simbula/config/bindings/structure_binding.dart';
import 'package:driver_simbula/features/authentication/signup/presentation/signup_page.dart';
import 'package:driver_simbula/features/authentication/login/presentation/login_page.dart';
import 'package:driver_simbula/features/structure/structure.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
    name: '/signup',
    page: () => const SignUpPage(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => HomeLanding(),
    binding: StructureBinding(),
  ),
];
