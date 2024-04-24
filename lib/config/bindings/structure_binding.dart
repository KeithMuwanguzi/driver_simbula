import 'package:driver_simbula/features/structure/controller/structure_controller.dart';
import 'package:get/get.dart';

class StructureBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StructureController>(() => StructureController());
  }
}
