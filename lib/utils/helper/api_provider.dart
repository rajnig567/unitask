import 'package:unitask/core.dart';

class APIProvider {
  late Dio _dio;

  APIProvider() {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = '';
    dioOptions.responseType = ResponseType.json;
    dioOptions.connectTimeout = const Duration(milliseconds: 30000);
    dioOptions.receiveTimeout = const Duration(milliseconds: 30000);

    dioOptions.headers = {
      "Content-Type": "application/json",
    };

    _dio = Dio(dioOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          // _controller.disableApiCalling();
          // if (error.response?.statusCode == 403) {
          //   StorageHelper storageHelper = Get.find();
          //   storageHelper.deleteLoginData();
          //   // Get.showError(title: 'Error', desc: 'Unauthorized').then((value) {
          //   updateHeader(token: apiKey);
          //   Get.offAllNamed(AppRoutes.loginPage,
          //       predicate: (route) => Get.currentRoute == AppRoutes.loginPage);
          //   // });
          // }
          //
          // if (error.type == DioExceptionType.connectionTimeout) {
          //   Get.showError(title: 'Oops!', desc: 'Connection timeout.');
          // }
        },
      ),
    );
  }

  Future<Response<dynamic>> getAPICallWithQueryParam(
      String url, dynamic data) async {
    final Response<dynamic> response =
        await _dio.get(url, queryParameters: data as Map<String, dynamic>);
    return response;
  }
}
