import 'package:nxt_task/data/models/reservation_model.dart';

abstract class ReservationStates {}
class ReservationInitialState extends ReservationStates {}
class ReservationLoadingState extends ReservationStates {}
class ReservationErrorState extends ReservationStates {}
class ReservationSuccessState extends ReservationStates {
  final ReservationModel reservationModel;
  ReservationSuccessState ({
    required this.reservationModel,
  });
}