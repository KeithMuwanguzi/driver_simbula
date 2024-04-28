import 'package:driver_simbula/features/onGoing/controllers/ongoing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OngoingOrdersController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            controller.times.value.toString(),
          ),
        ),
      ),
    );
  }
}
