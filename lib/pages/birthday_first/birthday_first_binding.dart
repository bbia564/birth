import 'package:get/get.dart';

import 'birthday_first_logic.dart';

class BirthdayFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirthdayFirstLogic());
  }
}
