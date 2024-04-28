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
          customerOrders.forEach((carId, orderData) {
            if (orderData['id'] == auth.currentUser!.uid) {
              times.value += 1;
            }
          });
        });
        ongoingOrders.assignAll(orders);
      }
    });
  }
}
