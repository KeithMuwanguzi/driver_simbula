import 'package:driver_simbula/features/authentication/signup/controllers/new_password_controller.dart';
import 'package:driver_simbula/shared/export.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

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
                      "LOGIN",
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 80,
                          ),
                          child: Column(
                            children: [
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
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: getStyle(
                                        color: Colors.blue,
                                        fontSize: 13,
                                        isBold: false,
                                        isItalic: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 75),
                              CustomButton(
                                buttonText: 'LOG IN',
                                buttonFunction: () {},
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
}