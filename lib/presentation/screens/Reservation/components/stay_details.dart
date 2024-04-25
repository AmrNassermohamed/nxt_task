import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nxt_task/presentation/screens/Reservation/components/hotell_gallery.dart';
import 'package:nxt_task/presentation/screens/Reservation/components/reverseration-details.dart';
import 'package:nxt_task/presentation/screens/Reservation/components/tickets.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/color_constants.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/dottted_line.dart';
import '../../../widgets/item_details.dart';
import 'guests_and_rooms.dart';
import 'hotel_location.dart';

class StayDetails extends StatelessWidget {
  const StayDetails({super.key,required this.stays,required this.startDate,required this.endDate,required this.reservation,required this.indexReservation});
  final List<Stays>? stays;
  final Reservations reservation;
  final int indexReservation;
  final String startDate;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Column(children: [
      for (int indexStay=0;
      indexStay < stays!.length;
      indexStay++)
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.padding2(context)),
          child: Container(
              padding: EdgeInsets.all(AppSize.padding2(context)),
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimaryContainer,
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReservationDetails(stays: stays![indexStay],indexReservation: indexReservation,indexStay: indexStay,),

                    Visibility(
                      visible: stays![indexStay].isOpened,
                      child: Column(children: [
                        const Divider(),
                        AppSize.spaceHeight2(context),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          ItemDetails(title: "From", subTitle: startDate),
                          ItemDetails(title: "Till", subTitle: endDate),
                        ],),
                        AppSize.spaceHeight2(context),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            CustomText(text: "Stars",fontWeight: FontWeight.bold,textFont: 16.sp,),
                            RatingBar.builder(
                              initialRating: double.parse( stays![indexStay].stars.toString()),
                              minRating: 1,
                              allowHalfRating: true,
                              unratedColor: Colors.amber.withAlpha(100),
                              itemCount: 5,
                              itemSize: 25.0,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rate) {},
                              ignoreGestures: true,
                            ),
                          ],),
                          ItemDetails(title: "Room Count", subTitle:stays![indexStay].rooms!.length.toString()),
                        ],),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          HotelLocation(stays: stays![indexStay]),
                          CustomText(
                            text: "Tickets :",
                            fontWeight: FontWeight.bold,
                            textFont: 15.sp,
                          ),
                          Tickets(userTickets: reservation.userTickets),
                          AppSize.spaceHeight2(context),
                          Container(
                              color: ColorConstant.whiteColor,
                              width: width(context)*.93,
                              child: CustomPaint(
                                painter: HorizontalDottedLinePainter(color: ColorConstant.grey12),
                              )),
                          AppSize.spaceHeight2(context),
                          GuestsAndRooms(stays: stays![indexStay]),
                          Container(
                              color: ColorConstant.whiteColor,
                              width: width(context)*.93,
                              child: CustomPaint(
                                painter: HorizontalDottedLinePainter(color: ColorConstant.grey12),
                              )),

                        ],),
                        HotelGallery(stays: stays![indexStay]),
                      ],),
                    )

                  ])),
        ),
    ],);
  }
}