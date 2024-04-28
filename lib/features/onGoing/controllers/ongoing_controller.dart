import 'package:driver_simbula/config/constants/constants.dart';
import 'package:driver_simbula/features/onGoing/models/car_model.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class OngoingOrdersController extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  final RxList<CarOnModel> ongoingOrders = <CarOnModel>[].obs;
  var times = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOngoingOrders();
  }

  void fetchOngoingOrders() {
    _databaseReference.child('ongoing_orders').onValue.listen((event) {
      final Map<dynamic, dynamic>? ordersMap =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (ordersMap != null) {
        List<CarOnModel> orders = [];
        ordersMap.forEach((customerId, customerOrders) {
          customerOrders.forEach((carId, value) {
            if (value['id'] == auth.currentUser!.uid) {
              orders.add(
                CarOnModel(
                  id: value['licensePlate'],
                  ownerId: value['id'],
                  brand: value['brand'],
                  model: value['model'],
                  transmission: value['transmission'],
                  imageUrl: value['imagePath'] ?? "",
                  maxSpeed: value['maxSpeed'],
                  price: value['price'],
                  availability: value['availability'] ?? "",
                  isPaid: value['isPaid'] ?? false,
                  timerValue: value['timer_value'] ?? 0,
                ),
              );
            }
          });
        });
        ongoingOrders.value = orders;
      }
    });
  }
}
