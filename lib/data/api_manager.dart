import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();

        dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<Response> getData(
      String endPoint, {
        Map<String, dynamic>? queryParameters,
      }) {
    return dio.get(
      AppConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  Future<Response> postData(
      String endPoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? headers
      }) {
    return dio.post(
      AppConstants.baseUrl + endPoint,
      data: body,

      options: Options(
        headers: headers,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }
}
