import 'package:birthday_record/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'birthday_first_logic.dart';

class BirthdayFirstPage extends GetView<BirthdayFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Birthday record')),
      body: SafeArea(
          child: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() {
                        return Text(
                          '${controller.toMonth.value} people',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        );
                      }),
                      Text(
                        'Birthday this month',
                        style: TextStyle(color: Colors.white.withOpacity(0.56)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.toMonthList.value.length,
                            itemBuilder: (_, index) {
                              final entity = controller.toMonthList
                                  .value[index];
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                child: <Widget>[
                                  Image.asset(
                                    'assets/icon${entity.type}.webp',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: <Widget>[
                                        Text(
                                          entity.nickname,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          entity.mark,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ].toColumn(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                      )),
                                  Text(
                                    '${entity.birthdayAfter} days later',
                                    style: TextStyle(color: primaryColor),
                                  )
                                ].toRow(),
                              )
                                  .decorated(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10))
                                  .marginOnly(bottom: 10);
                            });
                      })
                    ].toColumn(),
                  ).decorated(
                      color: const Color(0xffffb919),
                      borderRadius: BorderRadius.circular(20)),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding:const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: controller.otherMonthList.value.length,
                        itemBuilder: (_, index) {
                          final entity = controller.otherMonthList.value[index];
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            child: <Widget>[
                              Image.asset(
                                'assets/icon${entity.type}.webp',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: <Widget>[
                                    Text(
                                      entity.nickname,
                                      style:
                                      const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      entity.mark,
                                      style: const TextStyle(
                                          color: Colors.grey),
                                    ),
                                  ].toColumn(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                  )),
                              Text(
                                '${entity.birthdayAfter} days later',
                                style: const TextStyle(color: Colors.black45),
                              )
                            ].toRow(),
                          )
                              .decorated(
                              color: Colors.white,
                              border:
                              Border.all(color: const Color(0xffe2f0f0)),
                              borderRadius: BorderRadius.circular(10))
                              .marginOnly(bottom: 10);
                        });
                  })
                ],
              ),
            )
                .decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(20))
                .marginOnly(left: 15, right: 15, top: 90, bottom: 15),
            Obx(() {
              return Visibility(
                visible: controller.toMonthList.value.isNotEmpty,
                child: Image.asset(
                  'assets/bg.webp',
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              );
            })
          ].toStack()),
    );
  }
}
