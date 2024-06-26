import 'dart:io';

import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/home/controllers/home_controller.dart';
import 'package:driver_simbula/shared/widgets/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewCarController extends GetxController {
  Rx<String> availability = "Daily".obs;
  final TextEditingController carBrand = TextEditingController();
  final TextEditingController carModel = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController licensePlate = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController speed = TextEditingController();
  Rx<String> transmission = "Manual".obs;
  late DatabaseReference carRef;
  var selectedImagePath = ''.obs;
  var isSelected = false.obs;
  var imageUrl = ''.obs;
  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    carRef = FirebaseDatabase.instance
        .ref()
        .child('cars')
        .child(auth.currentUser!.uid);
    super.onInit();
  }

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

  String? validatePrice(String? text) {
    if (text == null || text.isEmpty) {
      return 'This can not be empty';
    }

    if (selectedImagePath.value == '') {
      return 'Please selected an image below';
    }

    return null;
  }

  toggleSelection() {
    selectedImagePath != ''
        ? isSelected.value = true
        : isSelected.value = false;
  }

  Future pickImage(ImageSource imageSource) async {
    final imageFile = await ImagePicker().pickImage(source: imageSource);
    if (imageFile == null) {
      Get.snackbar('Error', 'No message Picked',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      selectedImagePath.value = imageFile.path;
      toggleSelection();
    }
  }

  void pushImageToDb({
    required String uid,
    required String brand,
    required String model,
    required String licensePlate,
    required String maxSpeed,
    required String transmission,
    required String availability,
    required String price,
  }) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirProfiles = referenceRoot.child('profiles');
    Reference referenceImageToUpload =
        referenceDirProfiles.child(selectedImagePath.value);
    try {
      await referenceImageToUpload.putFile(File(selectedImagePath.value));
      imageUrl.value = await referenceImageToUpload.getDownloadURL();
      homeController.addCar(
        uid: auth.currentUser!.uid,
        brand: brand,
        model: model,
        licensePlate: licensePlate,
        maxSpeed: maxSpeed,
        transmission: transmission,
        availability: availability,
        price: price,
        imagePath: imageUrl.value,
      );
    } catch (e) {
      errorSnackBar(
        duration: const Duration(seconds: 2),
        icon: Icons.error,
        title: "Error Saving",
        text: "There is nothing to save",
      );
    }
  }
}
