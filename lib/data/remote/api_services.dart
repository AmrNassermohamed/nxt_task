import 'package:dio/dio.dart';
import '../../common/utils/constants.dart';
import 'api_exception.dart';
import 'end_points.dart';


class ApiServices {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        headers: headerApIServices,
        baseUrl: EndPoints.rootLink,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future getData({
    required String url,
  }) async {
    try {
      return await dio.get(
        url,
        options: Options(
          followRedirects: false,
        ),
      );
    } on DioException catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
       throw errorMessage;
    }
  }

}
