import 'package:dio/dio.dart';
import 'package:my_prayers/core/network/api_error_handler.dart';
import 'package:my_prayers/core/network/api_result.dart';

class ApiCallsHandler {
  Future<ApiResult<T>> handler<T>(
      {required Future<Response> Function() apiCall,
      required T Function(Map<String, dynamic> data) parser}) async {
    try {
      Response response = await apiCall();
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiResult.success(parser(response.data));
      } else {
        return ApiResult.failure(
          ApiErrorHandler(
            code: response.statusCode!,
            status: response.statusMessage!,
            data: response.data["data"],
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorHandler(
          code: e.response!.statusCode!,
          data: e.response!.data["data"],
          status: e.response!.statusMessage!,
        ),
      );
    }
  }
}
