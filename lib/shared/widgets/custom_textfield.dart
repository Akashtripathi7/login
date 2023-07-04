import 'package:flutter/material.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/constants/textStyles_constants.dart';

import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onTap,
    this.suffix,
    this.hintText,
    this.controller,
    this.enabled,
    this.onChanged,
    this.isNumeric,
    this.onSubmit,
    this.maxLines,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.prefix,
    this.labelText,
    this.labelTextColor,
    this.hintTextColor,
    this.borderColor,
    this.fillColor,
    this.suffixText,
    this.isEditProfile = false,
  }) : super(key: key);

  final onTap;
  final isEditProfile;
  final suffix;
  final hintText;
  final controller;
  final enabled;
  final onChanged;
  final isNumeric;
  final onSubmit;
  final maxLines;
  final padding;
  final prefix;
  final fillColor;
  final labelText;
  final suffixText;
  final labelTextColor;
  final hintTextColor;
  final borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: fillColor ?? Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(maxLines != null ? 20.sp : 20.sp)),
          border: Border.all(width: 1, color: borderColor)),
      child: TextField(
        maxLines: maxLines ?? 1,
        enabled: enabled,
        controller: controller,
        onTap: onTap,
        // focusNode: _node,

        onSubmitted: onSubmit,
        onChanged: onChanged,

        cursorColor: Pallete.primary.withOpacity(0.5),
        keyboardType:
            isNumeric != null && isNumeric ? TextInputType.number : null,

        style:
            DesignTextStyles.s12SB(color: labelTextColor ?? Pallete.blackText),

        decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            suffixText: suffixText,
            suffixStyle: DesignTextStyles.s12SB(color: Pallete.greyText),
            hintStyle: DesignTextStyles.s12R(color: hintTextColor),
            labelStyle: DesignTextStyles.s12R(),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.transparent)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.transparent),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.transparent),
            ),
            hintText: hintText,
            label: labelText == null ? null : Text('$labelText')),
      ),
    );
  }
}
