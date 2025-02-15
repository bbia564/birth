import 'package:get/get.dart';

import 'birthday_cof_logic.dart';

class BirthdayCofBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
