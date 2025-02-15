import 'dart:async';

import 'package:birthday_record/db_birthday/birthday_entity.dart';
import 'package:birthday_record/db_birthday/db_birthday.dart';
import 'package:get/get.dart';

class BirthdayFirstLogic extends GetxController {
  DBBirthday dbBirthday = Get.find();

  var toMonth = 0.obs;

  var toMonthList = <BirthdayEntity>[].obs;

  var otherMonthList = <BirthdayEntity>[].obs;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final result = await dbBirthday.getBirthdayAllData();
      for (var element in result) {
        if (element.isOut) {
          element.birthday =
              DateTime(element.birthday.year + 1, element.birthday.month);
          await dbBirthday.updateBirthday(element);
          getData();
          break;
        }
      }
    });
  }

  void getData() async {
    toMonthList.clear();
    otherMonthList.clear();
    final result = await dbBirthday.getBirthdayAllData();
    for (var element in result) {
      if (element.birthday.year == DateTime.now().year &&
          element.birthday.month == DateTime.now().month) {
        toMonthList.add(element);
      } else {
        otherMonthList.add(element);
      }
    }
    toMonth.value = toMonthList.length;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    startTimer();
    super.onInit();
  }
}
