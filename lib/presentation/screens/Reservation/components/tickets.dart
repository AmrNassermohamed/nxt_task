import 'package:flutter/material.dart';
import '../../../../common/utils/app_sizes.dart';
import '../../../../data/models/reservation_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/dottted_line.dart';
import '../../../widgets/item_details.dart';

class Tickets extends StatelessWidget {
  final List<UserTickets>? userTickets;
  const Tickets({super.key, required this.userTickets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int indexTickets = 0;
        indexTickets < userTickets!.length;
        indexTickets++)
          Padding(
            padding: EdgeInsets.all(AppSize.padding2(context)),
            child: Center(
                child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSize.padding2(context)),
                        color: Theme.of(context).colorScheme.onSecondary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      userTickets![indexTickets]
                                          .ticketUserData!
                                          .avatar
                                          .toString()),
                                ),
                                AppSize.spaceWidth3(context),
                                ItemDetails(
                                    subTitle: userTickets![indexTickets]
                                        .ticketSystemId!
                                        .toString(),
                                    title: userTickets![indexTickets]
                                        .ticketUserData!
                                        .firstName
                                        .toString()),
                              ],
                            ),
                            AppSize.spaceHeight3(context),
                            CustomText(
                                text:
                                "Ticket Type : ${userTickets![indexTickets].ticketTypeName!.toString()}"),
                            CustomText(
                                text:
                                "Seat : ${userTickets![indexTickets].seat!.toString()}"),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -20,
                        top: 60,
                        // Set left offset to 20
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: 73,
                        child: Container(
                            color: Theme.of(context).colorScheme.primary,
                            width: width(context) * .93,
                            child: CustomPaint(
                              painter: HorizontalDottedLinePainter(
                                  color: Theme.of(context).colorScheme.primary),
                            )),
                      ),
                      Positioned(
                        left: -20,
                        top: 60,
                        // Set left offset to 20
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    ])),
          ),
      ],
    );
  }
}