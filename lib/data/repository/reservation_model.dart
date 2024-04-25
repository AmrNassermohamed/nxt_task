import 'package:dio/dio.dart';
import 'package:nxt_task/data/models/reservation_model.dart';

import '../remote/api_services.dart';
import '../remote/end_points.dart';

class ReservationRepo {
  static final ReservationRepo _appRepository = ReservationRepo._internal();

  ReservationRepo._internal();

  factory ReservationRepo() {
    return _appRepository;
  }

  final _provider = ApiServices();

  Future<ReservationModel> getUsersEvents() async {
    try {
      Response? response = await _provider.getData(
        url: EndPoints.userEvents,
      );
      ReservationModel reservationModel =
      ReservationModel.fromJson(response!.data);
      return reservationModel;
    } catch (ex) {
      rethrow;
    }
  }
}
