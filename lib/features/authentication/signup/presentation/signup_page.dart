import 'package:driver_simbula/features/authentication/signup/controllers/signup_controller.dart';
import 'package:driver_simbula/features/authentication/signup/presentation/new_password.dart';
import 'package:driver_simbula/shared/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        "Already Have an Account?",
                        style: getStyle(
                          color: Colors.black,
                          fontSize: 18,
                          isBold: false,
                          isItalic: false,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'LOG IN',
                          style: getStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            isBold: true,
                            isItalic: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    SizedBox(height: MediaQuery.of(context).size.height / 7),
                    Text(
                      "SIGN UP",
                      style: getStyle(
                        color: Colors.white,
                        fontSize: 20,
                        isBold: true,
                        isItalic: false,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: 30,
                child: Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 500,
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
                        key: controller.key,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 30,
                          ),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: controller.email,
                                hintText: 'johndoe@example.com',
                                isPassword: false,
                                validate: controller.validateEmail,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: controller.name,
                                hintText: 'Full Name -e.g-{Muwanguzi Keith}',
                                isPassword: false,
                                validate: controller.validateField,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: controller.number,
                                hintText: 'Contact -e.g-{+256 774538700}',
                                isPassword: false,
                                validate: controller.validateField,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: controller.carBrand,
                                hintText: 'Car Brand -e.g-{Toyota}',
                                isPassword: false,
                                validate: controller.validateField,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: controller.carModel,
                                hintText: 'Car Model -e.g-{Premio}',
                                isPassword: false,
                                validate: controller.validateField,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: controller.licensePlate,
                                hintText: 'License Plate -e.g-{UGZ 001D}',
                                isPassword: false,
                                validate: controller.validateField,
                              ),
                              const SizedBox(height: 25),
                              CustomButton(
                                buttonText: 'SIGN UP',
                                buttonFunction: () {
                                  if (controller.key.currentState!.validate()) {
                                    Get.to(
                                      () => NewPasswordPage(
                                        email: controller.email.text.trim(),
                                        name: controller.name.text.trim(),
                                        contact: controller.number.text.trim(),
                                        carBrand:
                                            controller.carBrand.text.trim(),
                                        carModel:
                                            controller.carModel.text.trim(),
                                        licensePlate:
                                            controller.licensePlate.text.trim(),
                                      ),
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
}
