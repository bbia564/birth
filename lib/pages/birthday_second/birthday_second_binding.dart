import 'package:get/get.dart';

import 'birthday_second_logic.dart';

class BirthdaySecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirthdaySecondLogic());
  }
}
