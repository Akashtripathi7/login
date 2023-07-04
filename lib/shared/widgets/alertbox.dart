import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/constants/textStyles_constants.dart';
import 'package:login/shared/widgets/custom_button.dart';

import 'package:sizer/sizer.dart';

class AlertBox extends StatelessWidget {
  AlertBox({
    Key? key,
    required this.title,
    this.padding = true,
    this.desc = "",
  }) : super(key: key);

  final String title;
  final bool padding;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sp),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
          contentPadding:
              !padding ? EdgeInsets.zero : const EdgeInsets.all(18.0),
          title: Center(
            child: Text(
              title,
              style: DesignTextStyles.s14B(color: Pallete.primary),
            ),
          ),
          content: desc.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        desc,
                        style: DesignTextStyles.s12R(color: Pallete.blackText),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          actions: <Widget>[
            CustomButton(
                onPressed: () {
                  Get.back();
                },
                bgColor: Pallete.primary,
                textColor: Pallete.backGround,
                isBorder: false,
                text: "Ok")
          ],
        ),
      ),
    );
  }
}
