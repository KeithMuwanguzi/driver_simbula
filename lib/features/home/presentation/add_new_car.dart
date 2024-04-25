import 'package:driver_simbula/features/home/controllers/new_car_controller.dart';
import 'package:driver_simbula/shared/styles/common_styles.dart';
import 'package:driver_simbula/shared/widgets/custom_button.dart';
import 'package:driver_simbula/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCar extends StatelessWidget {
  const NewCar({super.key});

  @override
  Widget build(BuildContext context) {
    final NewCarController controller = Get.put(NewCarController());
    return Scaffold(
      body: ListView(
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
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    controller: controller.speed,
                    hintText: 'Max Speed -e.g-{180 KPH}',
                    isPassword: false,
                    validate: controller.validateField,
                  ),
                  const SizedBox(height: 15),
                  transmissionDrop(controller),
                  const SizedBox(height: 15),
                  availabilityDrop(controller),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    controller: controller.price,
                    hintText: 'Price Charge -e.g-{1,000,000}',
                    isPassword: false,
                    validate: controller.validateField,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    buttonText: 'SIGN UP',
                    buttonFunction: () {
                      if (controller.key.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  DropdownButtonFormField<String> transmissionDrop(controller) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Transmission',
        labelStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.italic,
          fontSize: 13,
        ),
      ),
      value: controller.transmission.value,
      onChanged: (newValue) {
        controller.transmission.value = newValue.toString();
      },
      items: <String>['Automatic', 'Manual']
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
          return 'Please select transmission';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField<String> availabilityDrop(controller) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Available',
        labelStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.italic,
          fontSize: 13,
        ),
      ),
      value: controller.availability.value,
      onChanged: (newValue) {
        controller.availability.value = newValue.toString();
      },
      items: <String>["Daily", "Weekly", "Monthly", "Annually"]
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
          return 'Please select availability';
        }
        return null;
      },
    );
  }
}
