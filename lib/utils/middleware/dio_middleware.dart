import 'package:dio/dio.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/utils/shared_preference/shared_preference_keys.dart';

final dio = Dio();
CancelToken cancelToken = CancelToken();

Dio dioApiCall() {
  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await sharedDataController.getSharedData(
        key: SharedPreferenceKeys.token);
    if (token != "") {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }, onError: (DioException exception, ErrorInterceptorHandler handler) {
    return handler.next(exception);
  }));
  return dio;
}
