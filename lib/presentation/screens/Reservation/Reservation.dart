import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nxt_task/common/constants/icon_constants.dart';
import 'package:nxt_task/presentation/screens/Reservation/model_bottom_sheet_reservation_details.dart';
import 'package:nxt_task/presentation/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'dart:io' as IO;
import '../../../common/constants/color_constants.dart';
import '../../../common/utils/app_sizes.dart';
import '../../../common/utils/theme.dart';
import '../../widgets/custom_button.dart';
import 'cubit/reservation_states.dart';
import 'cubit/resevation_cubit.dart';
import 'model_bottom_sheet_ticket.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return BlocProvider(
        create: (context) => ReservationCubit()..getReservations(),
        child: BlocConsumer<ReservationCubit, ReservationStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ReservationSuccessState) {
                return Scaffold(
                    body: SafeArea(
                        child: Container(
                            color: Theme.of(context).colorScheme.primary,
                            padding: EdgeInsets.all(AppSize.padding4(context)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.home_work_outlined,color: Theme.of(context).colorScheme.secondary,),
                                      AppSize.spaceWidth2(context),
                                      CustomText(
                                        text: "Theme",
                                        fontWeight: FontWeight.bold,
                                        textFont: 15.sp,
                                      ),
                                    ],),

                                 InkWell(onTap: (){
                                   themeCubit.toggleTheme();
                                 },child:Theme.of(context).brightness ==
                                     Brightness.dark? SvgPicture.asset(IconConstants.darkMode):SvgPicture.asset(IconConstants.lightMode))   ,
                                  ],
                                ),
                                Column(
                                  children: [
                                    DefaultButton(
                                      text: "Open Reservation",
                                      function: () {
                                        bottomSheetReservationDetails(context:context);
                                      },
                                      btnWidth: width(context) * .8,
                                    ),
                                    AppSize.spaceHeight2(context),
                                    DefaultButton(
                                      textColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      background:
                                          Theme.of(context).colorScheme.primary,
                                      borderColor: IO.Platform.isIOS
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
                                      text: IO.Platform.isIOS
                                          ? "Show Ios ticket"
                                          : "Show Android ticket",
                                      function: () {

                                       bottomSheetTicket(context:context,reservations: state.reservationModel.reservations);
                                      },
                                      btnWidth: width(context) * .8,
                                    )
                                  ],
                                )
                              ],
                            ))));
              } else if (state is ReservationErrorState) {
                return Container();
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor,
                  ),
                );
              }
            }));
  }
}
