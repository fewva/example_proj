import 'package:dio/dio.dart';
import 'package:example_proj/services/network/core_api_interface.dart';

class DioCoreApi implements CoreApiInterface {
  final Dio _dio;

  DioCoreApi(this._dio);

  @override
  Future<Response> getRequest(String url) async {
    final Response result = await _dio.get(url);
    return result;
  }

  @override
  Future<Response>? postRequest(String url, Map body) async {
    final Response result = await _dio.post(url, data: body);
    return result;
  }
}
