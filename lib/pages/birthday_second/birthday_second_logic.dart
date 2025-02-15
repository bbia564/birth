import 'package:birthday_record/db_birthday/db_birthday.dart';
import 'package:birthday_record/pages/birthday_tab/birthday_tab_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../db_birthday/birthday_entity.dart';
import '../birthday_first/birthday_first_logic.dart';

class BirthdaySecondLogic extends GetxController {

  DBBirthday dbBirthday = Get.find();

  int type = 0;
  String nickname = '';
  String mark = '';
  DateTime? birthday;
  String birthdayStr = '';

  void timeSelect(BuildContext context) {
    DatePicker.showDatePicker(context,dateFormat: 'MM-dd',onConfirm: (dateTime, List<int> index) {
      birthday = DateTime(dateTime.year,dateTime.month,dateTime.day,23,59,59);
      birthdayStr = DateFormat('MM-dd').format(dateTime);
      update();
    });
  }

  void commit() async {
    if (nickname.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the nickname');
      return;
    }
    if (mark.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the mark');
      return;
    }
    if (birthday == null) {
      Fluttertoast.showToast(msg: 'Please select the birthday');
      return;
    }
    await dbBirthday.insertBirthday(BirthdayEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: type,
      nickname: nickname,
      mark: mark,
      birthday: birthday!,
    ));
    Fluttertoast.showToast(msg: 'Added successfully');
    type = 0;
    nickname = '';
    mark = '';
    birthday = null;
    birthdayStr = '';
    update();
    BirthdayFirstLogic logic = Get.find();
    logic.getData();
    BirthdayTabLogic birthdayTabLogic = Get.find();
    birthdayTabLogic.currentIndex.value = 0;
    birthdayTabLogic.pageController.jumpToPage(0);
  }

}
