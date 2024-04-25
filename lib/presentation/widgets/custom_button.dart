import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../common/utils/app_sizes.dart';



class DefaultButton extends StatelessWidget {

  Color? background;
  Color? textColor;
  bool isWidget = true;
  double? radius;
  double? btnWidth;
  double? btnHeight;
  final Function function;
  String? text;
  Widget? widget;
  double? fontSize;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? borderColor;
  DefaultButton(
      {Key? key,
        required this.function,
        this.text,
        this.background,
        this.btnWidth,
        this.textColor,

        this.fontSize,
        this.fontWeight,
        this.borderColor,
        this.radius,
        this.textAlign,
        this.btnHeight,
        this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight ??6.h,    //It will take a 20% of screen width
      width: btnWidth ??width(context) * .9,
      decoration: BoxDecoration(
          color: background ?? Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            radius ?? 8.0,
          ),
          border: Border.all(color: borderColor??Theme.of(context).colorScheme.secondary,)
      ),
      child: MaterialButton(

        onPressed:() {
          function();
        } ,

        child: Text(
          text!,
          textAlign: textAlign,
          style:  TextStyle(
              fontSize: fontSize??11.sp,
              color: textColor ??Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}


