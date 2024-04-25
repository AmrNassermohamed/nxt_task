import 'package:flutter/material.dart';
import 'package:nxt_task/presentation/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const ItemDetails({super.key,required this.title,required this.subTitle});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      CustomText(text: title,fontWeight: FontWeight.bold,textFont: 13.sp,),
      CustomText(text: subTitle,textColor: Theme.of(context).colorScheme.outline,),
    ],);
  }
}