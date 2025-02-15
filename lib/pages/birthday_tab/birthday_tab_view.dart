import 'package:birthday_record/pages/birthday_first/birthday_first_view.dart';
import 'package:birthday_record/pages/birthday_second/birthday_second_view.dart';
import 'package:birthday_record/pages/birthday_third/birthday_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'birthday_tab_logic.dart';

class BirthdayTabPage extends GetView<BirthdayTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          BirthdayFirstPage(),
          BirthdaySecondPage(),
          BirthdayThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navBirthdayBars()),
    );
  }

  Widget _navBirthdayBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
