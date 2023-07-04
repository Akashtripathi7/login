import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/constants/textStyles_constants.dart';
import 'package:login/pages/login/controller/login_controller.dart';
import 'package:login/shared/widgets/custom_button.dart';

import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final auth = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.backGround,
        body: Padding(
          padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 12.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "Thank you for loging in our app ",
                                  style: DesignTextStyles.s14M(
                                      color: Pallete.blackText),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    auth.logout();
                                  },
                                  text: "Log Out",
                                  upperCase: false,
                                  isBorder: false,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
