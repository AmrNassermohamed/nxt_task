import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/icon_constants.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/item_details.dart';

class HotelLocation extends StatelessWidget {
  final Stays stays;
 const HotelLocation({super.key, required this.stays});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      AppSize.spaceHeight2(context),
      CustomText(text: "Location :",fontWeight: FontWeight.bold,textFont: 16.sp,),
      AppSize.spaceHeight1(context),
      Container(color:  Theme.of(context).colorScheme.onSecondary,
        padding: EdgeInsets.all(AppSize.padding2(context)),
        child: Row(children: [
        Expanded(child: ItemDetails(title:stays!.name.toString() , subTitle: stays!.address.toString() )),
        AppSize.spaceWidth2(context),
        Image.asset(IconConstants.map,),
      ],),),
      AppSize.spaceHeight2(context),
    ],);
  }
}