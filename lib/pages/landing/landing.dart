import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';

import 'package:get/get.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/pages/landing/landing_controller.dart';
import 'package:sizer/sizer.dart';

class Landing extends StatelessWidget {
  LandingConroller c = Get.put(LandingConroller());

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.backGround,
        body: Center(
          child: Image.asset(
            'assets/logo.png',
          ),
        ));
  }
}
