import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cars Added by You',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount:
                      controller.cars.length, // Replace with actual car count
                  itemBuilder: (context, index) {
                    // Generate dummy car data
                    final carName =
                        '${controller.cars[index].brand} ${controller.cars[index].model}';
                    final carImage =
                        'assets/images/car_${index + 1}.png'; // Replace with actual image URL
                    return GestureDetector(
                      onTap: () {
                        // Navigate to car details page
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailsPage(carName)));
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                            leading: Image.asset(
                              carImage,
                              width: 100,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            title: Text(carName),
                            subtitle: Text(
                                '${controller.cars[index].id}  UGX ${controller.cars[index].price}')),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addCar(
            uid: auth.currentUser!.uid,
            brand: 'Toyota',
            model: "Spacio",
            licensePlate: "UBM 717G",
            maxSpeed: "180 KPH",
            transmission: "Automatic",
            availability: "Daily",
            price: "25,000",
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
