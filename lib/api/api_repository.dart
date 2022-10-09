import 'package:dio/dio.dart';

class ApiRepository {
  final String url;
  final  payload;

  ApiRepository({required this.url, this.payload});

  final Dio _dio = Dio();

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio.get(url, queryParameters: payload).then((response) {
      onSuccess(response.data);
    }).catchError((error) {
      onError(error);
    });
  }
}