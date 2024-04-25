import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nxt_task/common/constants/icon_constants.dart';
import 'package:sizer/sizer.dart';
import '../../../common/utils/app_sizes.dart';
import '../../../data/models/reservation_model.dart';
import '../../widgets/custom_text.dart';
import 'components/tickets.dart';

bottomSheetTicket(
    {required BuildContext context, List<Reservations>? reservations}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    context: context,
    isScrollControlled: true,
    builder: (_) {
      return SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
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
                      padding: EdgeInsets.all(AppSize.padding2(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSize.spaceHeight1(context),
                          CustomText(
                            text: "Tickets :",
                            fontWeight: FontWeight.bold,
                            textFont: 15.sp,
                          ),
                          for (int indexReservation = 0;
                              indexReservation < reservations!.length;
                              indexReservation++)
                            Tickets(
                              userTickets:
                                  reservations[indexReservation].userTickets,
                            ),
                          AppSize.spaceHeight2(context),
                        ],
                      ),
                    )
                  ])));
    },
  );
}


