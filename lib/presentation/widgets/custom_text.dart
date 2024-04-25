import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomText extends StatelessWidget {
  final String? text;
  final double? textFont;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  TextDecoration? textDecoration;
  CustomText(
      {super.key,
      required this.text,
      this.textFont,
      this.textColor,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: textFont ?? 11.sp,
        fontFamily: 'Cairo',
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor ?? Theme.of(context).colorScheme.secondary ,
        decoration: textDecoration,
          decorationColor: textColor ?? Theme.of(context).colorScheme.secondary
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
