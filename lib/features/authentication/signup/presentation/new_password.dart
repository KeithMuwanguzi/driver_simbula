import 'package:driver_simbula/config/database/firebase_services.dart';
import 'package:driver_simbula/features/authentication/signup/controllers/new_password_controller.dart';
import 'package:driver_simbula/shared/export.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;
  final String name;
  final String contact;
  final String carBrand;
  final String carModel;
  final String licensePlate;
  final String price;
  final String transmission;
  final String maxSpeed;
  final String availability;
  const NewPasswordPage({
    super.key,
    required this.email,
    required this.name,
    required this.contact,
    required this.carBrand,
    required this.carModel,
    required this.licensePlate,
    required this.transmission,
    required this.maxSpeed,
    required this.price,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 27, 5, 124),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0), // Adjust as needed
                    bottomRight: Radius.circular(80.0), // Adjust as needed
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    Text(
                      "PASSWORD",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3,
                left: 30,
                child: Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: const Offset(0, 3), // Offset
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    children: [
                      Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 60,
                          ),
                          child: Column(
                            children: [
                              Obx(
                                () => genderButton(controller),
                              ),
                              const SizedBox(height: 25),
                              Obx(
                                () => CustomPasswordFormField(
                                  userFunction: () =>
                                      controller.changeVisibility(),
                                  controller: controller.password,
                                  hintText: "Your Password",
                                  isVisible: controller.isVisible.value,
                                  validate: controller.validatePassword,
                                ),
                              ),
                              const SizedBox(height: 25),
                              Obx(
                                () => CustomPasswordFormField(
                                  userFunction: () =>
                                      controller.changeConfirmVisibility(),
                                  controller: controller.confirmPassword,
                                  hintText: "Confirm Your Password",
                                  isVisible: controller.isConfirmVisible.value,
                                  validate: controller.validateConfirmPassword,
                                ),
                              ),
                              const SizedBox(height: 75),
                              CustomButton(
                                buttonText: 'REGISTER',
                                buttonFunction: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    AuthController.instance
                                        .createUserWithEmailAndPassword(
                                      email: email,
                                      password: controller.password.text.trim(),
                                      name: name,
                                      phoneNumber: contact,
                                      gender: controller.selected.value,
                                      carBrand: carBrand,
                                      carModel: carModel,
                                      licensePlate: licensePlate.toUpperCase(),
                                      transmission: transmission,
                                      maxSpeed: maxSpeed,
                                      price: price,
                                      availability: availability,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  DropdownButtonFormField<String> genderButton(controller) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Gender',
        labelStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.italic,
          fontSize: 13,
        ),
      ),
      value: controller.selected.value,
      onChanged: (newValue) {
        controller.selected.value = newValue.toString();
      },
      items: <String>['Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: getStyle(
              color: Colors.black,
              fontSize: 14,
              isBold: false,
              isItalic: false,
            ),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender';
        }
        return null;
      },
    );
  }
}
