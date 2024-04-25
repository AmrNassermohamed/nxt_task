import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';
import '../cubit/reservation_states.dart';
import '../cubit/resevation_cubit.dart';


class ReservationDetails extends StatelessWidget {
  final Stays stays;
  final int indexReservation;
  final int indexStay;
  const ReservationDetails({super.key, required this.stays,required this.indexReservation,required this.indexStay});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return  BlocConsumer<ReservationCubit, ReservationStates>(
        listener: (context, state) {},
    builder: (context, state) {
          if(state is ReservationSuccessState) {
            return Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  InkWell(
                    onTap: () {
                      ReservationCubit.get(context).openStayDetails(
                          indexReservation, indexStay,state.reservationModel);
                    },
                    child:  Icon(stays.isOpened==false?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,color: Theme.of(context).colorScheme.secondary,),
                  ),
                  AppSize.spaceWidth2(context),
                  CustomText(text: stays.name,
                      fontWeight: FontWeight.bold,
                      textFont: 16.sp)
                ],),
                CircleAvatar(
                  backgroundImage:
                  NetworkImage(stays.stayImages!.first),
                ),
              ],),
            ],);
          }else{
            return Container();
          }
    });
  }
}