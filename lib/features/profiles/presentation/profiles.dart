import 'package:driver_simbula/config/database/firebase_services.dart';
import 'package:driver_simbula/shared/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              Get.bottomSheet(
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Text(
                        'Are you sure you want to logout?',
                        style: getStyle(
                          color: Colors.black,
                          fontSize: 18,
                          isBold: false,
                          isItalic: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              AuthController.instance.signOut();
                            },
                          ),
                          const SizedBox(width: 70),
                          IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
