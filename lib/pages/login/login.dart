import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/constants/textStyles_constants.dart';
import 'package:login/pages/login/controller/login_controller.dart';
import 'package:login/shared/widgets/custom_button.dart';
import 'package:login/shared/widgets/custom_input_password.dart';
import 'package:login/shared/widgets/custom_textfield.dart';
import 'package:login/shared/widgets/helpers.dart';

import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final auth = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGround,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextField(
                      fillColor: Pallete.backGround,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      onTap: () {},
                      hintText: "Email",
                      borderColor: Pallete.greyText,
                      hintTextColor: Pallete.greyText,
                      labelTextColor: Pallete.blackText,
                      onChanged: (val) {
                        auth.email.value = val;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomInputPassword(
                        iconColor: Pallete.primary,
                        hintTextColor: Pallete.greyText,
                        obscureText: true,
                        borderColor: Pallete.greyText,
                        label: "Password",
                        onChanged: (value) {
                          auth.password.value = value;
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(
                      () => auth.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Pallete.primary,
                            )
                          : CustomButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (auth.email.value == '') {
                                  toast("Email can not be empty");
                                  return;
                                }
                                if (auth.password.value == '') {
                                  toast("Password can not be empty");
                                  return;
                                }
                                if (auth.password.value.length < 8) {
                                  toast("Password should have 8 characters");
                                  return;
                                }
                                auth.login();
                              },
                              text: "Login",
                              bgColor: Pallete.primary,
                              upperCase: false,
                            ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't have an account? ",
                                  style: DesignTextStyles.s12M(
                                      color: Pallete.blackText),
                                ),
                                Text(
                                  "Sign up",
                                  style: DesignTextStyles.s12SB(
                                      color: Pallete.primary),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 1.2.h,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                "Forgot Password",
                                style: DesignTextStyles.s12R(
                                    color: Pallete.blackText),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Divider(
                                  thickness: 0.3.w,
                                  height: 0.1.h,
                                  color: Pallete.greyText,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
