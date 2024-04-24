import 'package:driver_simbula/features/home/presentation/home.dart';
import 'package:driver_simbula/features/onGoing/presentation/ongoing.dart';
import 'package:driver_simbula/features/payments/presentation/payments.dart';
import 'package:driver_simbula/features/profiles/presentation/profiles.dart';
import 'package:driver_simbula/features/structure/controller/structure_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLanding extends StatelessWidget {
  HomeLanding({super.key});

  final StructureController controller = Get.find<StructureController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.currentPage.value) {
          case 0:
            return const HomePage();
          case 1:
            return const OnGoing();
          case 2:
            return const Payments();
          case 3:
            return const ProfilePage();
          default:
            return const SizedBox.shrink();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentPage.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'OnGoing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Payments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.6),
        ),
      ),
    );
  }
}
