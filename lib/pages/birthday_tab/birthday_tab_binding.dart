import 'package:get/get.dart';

import '../birthday_first/birthday_first_logic.dart';
import '../birthday_second/birthday_second_logic.dart';
import '../birthday_third/birthday_third_logic.dart';
import 'birthday_tab_logic.dart';

class BirthdayTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirthdayTabLogic());
    Get.lazyPut(() => BirthdayFirstLogic());
    Get.lazyPut(() => BirthdaySecondLogic());
    Get.lazyPut(() => BirthdayThirdLogic());
  }
}
