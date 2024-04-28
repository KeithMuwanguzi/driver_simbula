import 'package:driver_simbula/config/database/firebase_services.dart';
import 'package:driver_simbula/features/home/presentation/add_new_car.dart';
import 'package:driver_simbula/features/onGoing/controllers/ongoing_controller.dart';
import 'package:driver_simbula/features/onGoing/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    final carController = AuthController.instance;
    final controller = Get.put(OngoingOrdersController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Running Orders',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: carController.ongoingOrders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: buildCar(
                            context,
                            carController.ongoingOrders[index],
                            controller,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const NewCar());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Container buildCar(BuildContext context, CarOnModel car,
      OngoingOrdersController controller) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.teal,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        car.model,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car.brand,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${car.transmission} | ${car.availability}',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment: ',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 24, 21, 189),
                        ),
                      ),
                      car.isPaid
                          ? Text(
                              'Cleared',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            )
                          : Text(
                              'Pending',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time Left | ',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${controller.formatTimerValue(car.timerValue)} ',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: car.timerValue < 100
                              ? Colors.red
                              : const Color.fromARGB(255, 24, 21, 189),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Hero(
                tag: car.model,
                child: Image.network(
                  car.imageUrl,
                  fit: BoxFit.fitWidth,
                  height: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
