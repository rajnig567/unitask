import 'package:unitask/core.dart';

class APIProvider {
  static final APIProvider _singleton = APIProvider._internal();

  APIProvider._internal();

  static APIProvider get instance => _singleton;
  late Dio _dio;

  void init() {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = APIConstants.baseURL;
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
          if (error.type == DioExceptionType.connectionTimeout) {
            Keys.navigationKey.currentState!.context
                .showErrorDialog(title: 'Oops!', message: 'Connection timeout.');
          }
        },
      ),
    );
  }

  Future<Response<dynamic>> getAPICall(
      String url, /*dynamic data*/) async {
    final Response<dynamic> response =
        await _dio.get(url, /*queryParameters: data as Map<String, dynamic>*/);
    return response;
  }
}
