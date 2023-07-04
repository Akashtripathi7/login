import 'package:flutter/material.dart';
import 'package:login/constants/pallete.dart';
import 'package:login/constants/textStyles_constants.dart';
import 'package:sizer/sizer.dart';

class CustomInputPassword extends StatefulWidget {
  CustomInputPassword(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.obscureText = false,
      this.color,
      this.iconColor,
      this.borderColor,
      this.hintTextColor,
      this.controller,
      this.enabled})
      : super(key: key);

  final String label;

  final void Function(String) onChanged;
  var obscureText;
  final color;
  final iconColor;
  final borderColor;
  final hintTextColor;
  final controller;
  final enabled;
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  var obscure = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(20.sp),
            border: Border.all(width: 1, color: widget.borderColor)),
        child: TextField(
          obscureText: obscure,
          enabled: widget.enabled,
          controller: widget.controller,
          cursorColor: Pallete.primary.withOpacity(0.5),
          decoration: InputDecoration(
              hintText: widget.label,
              hintStyle: DesignTextStyles.s12R(
                color: widget.hintTextColor,
              ),
              labelStyle: DesignTextStyles.s12R(),
              contentPadding: const EdgeInsets.all(17),
              suffixIcon: obscure
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscure = false;
                        });
                      },
                      child: Icon(
                        Icons.visibility_off_outlined,
                        color: widget.iconColor,
                      ))
                  : InkWell(
                      onTap: () {
                        setState(() {
                          obscure = true;
                        });
                      },
                      child: Icon(
                        Icons.visibility_outlined,
                        color: widget.iconColor,
                      )),
              border: InputBorder.none),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
