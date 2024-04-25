import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/constants/color_constants.dart';
import '../../../common/constants/icon_constants.dart';
import '../../../common/utils/app_sizes.dart';
import '../../../data/models/reservation_model.dart';
import '../../widgets/item_details.dart';
import 'components/stay_details.dart';
import 'cubit/reservation_states.dart';
import 'cubit/resevation_cubit.dart';

bottomSheetReservationDetails({required BuildContext context}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      constraints: BoxConstraints.tight(
        Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .95),
      ),
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
            value: BlocProvider.of<ReservationCubit>(context),
        child:BlocConsumer<ReservationCubit, ReservationStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ReservationSuccessState) {
                List<Reservations>? reservations =
                    state.reservationModel.reservations;

                return SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSize.spaceHeight2(context),
                              Center(
                                  child: SvgPicture.asset(
                                IconConstants.rectangle,
                              )),
                              AppSize.spaceHeight2(context),
                              Container(
                                color: Theme.of(context).colorScheme.onPrimary,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl: reservations!.first.stays!
                                            .first.stayImages!.first
                                            .toString()),
                                    AppSize.spaceHeight2(context),
                                    Container(
                                      padding: EdgeInsets.all(
                                          AppSize.padding2(context)),
                                      child: Column(
                                        children: [
                                          Visibility(
                                              visible: reservations!.length > 1,
                                              child: const ItemDetails(
                                                  title: "Hotel Check It",
                                                  subTitle:
                                                      "Multiple Reservations")),
                                        ],
                                      ),
                                    ),
                                    AppSize.spaceHeight2(context),
                                    for (int indexReservation = 0;
                                        indexReservation < reservations!.length;
                                        indexReservation++)
                                      Padding(
                                        padding: EdgeInsets.all(
                                            AppSize.padding2(context)),
                                        child: StayDetails(
                                          indexReservation: indexReservation,
                                          stays: reservations[indexReservation]
                                              .stays,
                                          startDate:
                                              reservations![indexReservation]
                                                  .startDate
                                                  .toString(),
                                          endDate:
                                              reservations![indexReservation]
                                                  .startDate
                                                  .toString(),
                                          reservation:
                                              reservations![indexReservation],
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ])));
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
      });
}
