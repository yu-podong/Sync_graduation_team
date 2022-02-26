import 'package:get/get.dart';
import 'package:mobile/contoller/bottom_nav_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(BottomNavController(), permanent: true);
  }
}