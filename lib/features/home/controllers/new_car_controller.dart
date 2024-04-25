import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCarController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController carBrand = TextEditingController();
  final TextEditingController carModel = TextEditingController();
  final TextEditingController licensePlate = TextEditingController();
  final TextEditingController speed = TextEditingController();
  final TextEditingController price = TextEditingController();
  Rx<String> transmission = "Manual".obs;
  Rx<String> availability = "Daily".obs;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can not be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validateField(String? text) {
    if (text == null || text.isEmpty) {
      return 'This can not be empty';
    }

    return null;
  }
}
