import 'package:driver_simbula/config/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/export.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _firebaseUser;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.authStateChanges());
    ever(_firebaseUser, initialScreen);
  }

  void createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String gender,
    required String userType,
    required String carBrand,
    required String carModel,
    required String licensePlate,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        addUserToFirebase(
          uid: user.uid,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          gender: gender,
          userType: userType,
        );
        addCarToFirebase(
          uid: user.uid,
          brand: carBrand,
          model: carModel,
          licensePlate: licensePlate,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error creating account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
      );
    }
  }

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'Error signing in',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.error,
        ),
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar(
        'Error signing out',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
      );
    }
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home');
    }
  }

  Future<void> addUserToFirebase({
    required String uid,
    required String email,
    required String name,
    required String phoneNumber,
    required String gender,
    required String userType,
  }) async {
    try {
      Get.dialog(
        const AlertDialog(
          title: Text('Loading'),
          actions: [
            Row(
              children: [
                CircularProgressIndicator(),
                Text('Registering your account'),
              ],
            )
          ],
        ),
      );

      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(uid);
      Map userData = {
        'id': uid,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'userType': "Driver",
        'imagePath': '',
      };

      await userRef.set(userData);
      Get.back();
    } catch (e) {
      errorSnackBar(
        duration: const Duration(seconds: 2),
        icon: Icons.error,
        title: 'Error Occured',
        text: e.toString(),
      );
    }
  }

  Future<void> addCarToFirebase({
    required String uid,
    required String brand,
    required String model,
    required String licensePlate,
  }) async {
    try {
      DatabaseReference carRef = FirebaseDatabase.instance.ref().child('cars');
      Map carData = {
        'id': uid,
        'model': model,
        'brand': brand,
        'licensePlate': licensePlate,
        'imagePath': '',
      };

      await carRef.set(carData);
    } catch (e) {
      errorSnackBar(
        duration: const Duration(seconds: 2),
        icon: Icons.error,
        title: 'Error Occured',
        text: e.toString(),
      );
    }
  }
}
