import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';

class HotelGallery extends StatelessWidget {
  const HotelGallery({super.key,required this.stays});
  final Stays stays;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      AppSize.spaceHeight2(context),
      CustomText(text: "Gallery :",fontWeight: FontWeight.bold,textFont: 16.sp,),
      AppSize.spaceHeight2(context),
      SizedBox(
        height: height(context)*.3,
        child: ListView.builder(
            itemCount:  stays!.stayImages!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, pagePosition) {
              return Padding(
                padding: EdgeInsets.only(left:AppSize.padding1(context)),
                child: Image.network(stays!.stayImages![pagePosition],fit: BoxFit.cover,width: width(context)*.4,

                ),
              );
            }),
      ),
    ],);
  }
}