import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'birthday_cof_logic.dart';

class BirthdayCofView extends GetView<PageLogic> {
  const BirthdayCofView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.bosco.value
              ? const CircularProgressIndicator(color: Colors.yellow)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.rjzwq();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
