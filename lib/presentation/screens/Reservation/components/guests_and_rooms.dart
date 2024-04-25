import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/item_details.dart';

class GuestsAndRooms extends StatelessWidget {
  const  GuestsAndRooms({super.key, required this.stays});
  final Stays stays;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      for (int indexRoom = 0; indexRoom < stays.rooms!.length; indexRoom++)
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: stays.rooms![indexRoom].roomTypeName,
            fontWeight: FontWeight.bold,
            textFont: 16.sp,
          ),
          AppSize.spaceHeight2(context),
          CustomText(
            text: "Guests(s)",
            fontWeight: FontWeight.bold,
            textFont: 16.sp,
          ),
          AppSize.spaceHeight1(context),
          HotelGuests(
              guests: stays.rooms![indexRoom].guests,
              room: stays.rooms![indexRoom])
        ])
    ]);
  }
}

class HotelGuests extends StatelessWidget {
  final List<Guests>? guests;
  final Rooms room;
  const HotelGuests({super.key, required this.guests, required this.room});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int indexGuest = 0; indexGuest < guests!.length; indexGuest++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(guests![indexGuest].avatar.toString()),
                  ),
                  AppSize.spaceWidth2(context),
                  CustomText(
                      text:
                          "${guests![indexGuest].firstName.toString()} ${guests![indexGuest].lastName.toString()}"),
                ],
              ),
              AppSize.spaceHeight2(context),
              ItemDetails(
                  title: "Room Type", subTitle: room.roomTypeName.toString()),
              AppSize.spaceHeight2(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemDetails(
                      title: "Room Number",
                      subTitle: room.roomNumber.toString()),
                  ItemDetails(
                      title: "Sleeps", subTitle: room.roomCapacity.toString()),
                ],
              ),
              AppSize.spaceHeight2(context),
            ],
          )
      ],
    );
  }
}
