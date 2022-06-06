import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/second_screen.dart';

class Controller extends GetxController {
  TextEditingController ctrl = TextEditingController();
  var buttonName = "edit".obs;
  void upDate() {
    if (ctrl.text.isNotEmpty) {
      buttonName.value = 'Save';
    } else {
      buttonName.value = 'Edit';
    }
  }

  void goToNexPage() {
    if (ctrl.text.isNotEmpty) {
      ctrl.clear();
      upDate();
      Get.to(() => const SecondScreen());
    }
  }
}
