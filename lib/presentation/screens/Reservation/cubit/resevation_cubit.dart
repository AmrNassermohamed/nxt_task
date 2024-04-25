import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nxt_task/data/models/reservation_model.dart';
import 'package:nxt_task/presentation/screens/Reservation/cubit/reservation_states.dart';
import '../../../../data/repository/reservation_model.dart';

// use cubit state
class ReservationCubit extends Cubit<ReservationStates> {
  ReservationCubit() : super(ReservationInitialState());
  static ReservationCubit get(context) => BlocProvider.of(context);
  final ReservationRepo userEventRepo = ReservationRepo();
  getReservations() async { //getAllReservationsFromEndPoint
    try {
      emit((ReservationLoadingState()));
      ReservationModel? reservationModel = await userEventRepo.getUsersEvents();
        emit(ReservationSuccessState(reservationModel: reservationModel));
    } catch (ex) {
      emit((ReservationErrorState()));
      rethrow;
    }
  }
  openStayDetails(int indexReservation,int indexStay ,ReservationModel reservationModel  ){ // that open stay Details
    if(reservationModel.reservations![indexReservation].stays![indexStay].isOpened==false) {
      reservationModel.reservations![indexReservation].stays![indexStay].isOpened =
      true;
    }else{
      reservationModel.reservations![indexReservation].stays![indexStay].isOpened =
      false;
    }
    emit((ReservationSuccessState(reservationModel: reservationModel)));

  }
  }



