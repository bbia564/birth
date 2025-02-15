import 'package:get/get.dart';

import 'birthday_third_logic.dart';

class BirthdayThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirthdayThirdLogic());
  }
}
