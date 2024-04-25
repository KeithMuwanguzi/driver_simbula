import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/home/controllers/new_car_controller.dart';
import 'package:driver_simbula/shared/styles/common_styles.dart';
import 'package:driver_simbula/shared/widgets/custom_button.dart';
import 'package:driver_simbula/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class NewCar extends StatelessWidget {
  const NewCar({super.key});

  @override
  Widget build(BuildContext context) {
    final NewCarController controller = Get.put(NewCarController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Car'),
      ),
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
                    validate: controller.validatePrice,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.pickImage(ImageSource.gallery);
                                  },
                                  child: const Icon(
                                    Icons.photo,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.pickImage(ImageSource.camera);
                                  },
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: controller.selectedImagePath.value == ''
                            ? const Center(
                                child: Icon(Icons.add),
                              )
                            : const Center(child: Text('Car ImagePath Added')),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    buttonText: 'Add Car',
                    buttonFunction: () {
                      if (controller.key.currentState!.validate()) {
                        controller.pushImageToDb(
                          uid: auth.currentUser!.uid,
                          brand: controller.carBrand.text.trim(),
                          model: controller.carModel.text.trim(),
                          licensePlate: controller.licensePlate.text.trim(),
                          maxSpeed: controller.speed.text.trim(),
                          transmission: controller.transmission.value,
                          availability: controller.availability.value,
                          price: controller.price.text.trim(),
                          imagePath: controller.imageUrl.value,
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
