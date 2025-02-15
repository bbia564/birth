import 'package:birthday_record/main.dart';
import 'package:birthday_record/pages/birthday_second/birthday_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'birthday_second_logic.dart';

class BirthdaySecondPage extends GetView<BirthdaySecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(18),
        child: GetBuilder<BirthdaySecondLogic>(
            init: BirthdaySecondLogic(),
            builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  const Text(
                    'Select avatar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 68,
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, mainAxisSpacing: 12),
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('assets/icon$index.webp',
                                  fit: BoxFit.cover),
                            )
                                .decorated(
                                    borderRadius: BorderRadius.circular(10),
                                    border: controller.type == index
                                        ? Border.all(
                                            color: Colors.red, width: 2)
                                        : null)
                                .gestures(onTap: () {
                              controller.type = index;
                              controller.update();
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      const Text('Nickname: '),
                      Expanded(
                          child: BirthdayTextField(
                              maxLength: 20,
                              value: controller.nickname,
                              onChange: (value) {
                                controller.nickname = value;
                              }))
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      const Text('Mark: '),
                      Expanded(
                          child: BirthdayTextField(
                              maxLength: 20,
                              value: controller.mark,
                              onChange: (value) {
                                controller.mark = value;
                              }))
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  Container(
                    height: 40,
                    child: <Widget>[
                      const Text('Birthday: '),
                      Expanded(
                          child: IgnorePointer(
                        child: BirthdayTextField(
                            hintText: 'Please select',
                            value: controller.birthdayStr,
                            onChange: (_) {}),
                      )),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  ).decorated(color: Colors.transparent).gestures(onTap: () {
                    controller.timeSelect(context);
                  }),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25))
                      .gestures(onTap: () {
                    controller.commit();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              );
            }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
