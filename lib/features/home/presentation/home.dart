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
              child: ListView.builder(
                itemCount: controller.length, // Replace with actual car count
                itemBuilder: (context, index) {
                  // Generate dummy car data
                  final carName = 'Car ${index + 1}';
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
                        subtitle: const Text('Lorem ipsum dolor sit amet'),
                        // Replace with actual car details
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
