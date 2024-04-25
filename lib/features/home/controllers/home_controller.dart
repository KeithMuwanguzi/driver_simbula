import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/home/models/car.dart';
import 'package:driver_simbula/shared/export.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref().child('cars');

  RxList<Car> cars = <Car>[].obs;
  var length = 5;

  @override
  void onInit() {
    super.onInit();
    fetchCars();
    print(cars);
  }

  void fetchCars() {
    try {
      databaseReference.child(auth.currentUser!.uid).onValue.listen((event) {
        final List<Car> fetchedCars = [];
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? carsMap =
              event.snapshot.value as Map<dynamic, dynamic>?;
          carsMap?.forEach((key, value) {
            fetchedCars.add(Car(
              id: value['licensePlate'],
              ownerId: value['id'],
              brand: value['brand'],
              model: value['model'],
              transmission: value['transmission'],
              imageUrl: value['imagePath'] ?? "",
              maxSpeed: value['maxSpeed'],
              price: value['price'],
              availability: value['availability'] ?? "",
            ));
          });
        }
        cars.value = fetchedCars;
        print(fetchedCars);
      });
    } catch (e) {
      errorSnackBar(
        duration: const Duration(seconds: 2),
        icon: Icons.error,
        title: 'Error Occured',
        text: e.toString(),
      );
    }
  }

  void addCar({
    required String uid,
    required String brand,
    required String model,
    required String licensePlate,
    required String maxSpeed,
    required String transmission,
    required String availability,
    required String price,
    required String imagePath,
  }) {
    DatabaseReference reference = FirebaseDatabase.instance
        .ref()
        .child('cars')
        .child(uid)
        .child(licensePlate);

    Map carData = {
      'id': uid,
      'model': model,
      'brand': brand,
      'licensePlate': licensePlate,
      'imagePath': imagePath,
      'maxSpeed': maxSpeed,
      'transmission': transmission,
      'price': price,
      'availability': availability,
    };

    reference.set(carData).then((_) {
      fetchCars();
    }).catchError((error) {
      errorSnackBar(
        duration: const Duration(seconds: 2),
        icon: Icons.error,
        title: 'Error Occured',
        text: error.toString(),
      );
    });
  }
}
