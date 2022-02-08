import 'package:dio/dio.dart';

abstract class CoreApiInterface {
  // ignore: unused_field
  final String _baseUrl;

  CoreApiInterface(this._baseUrl);

  Future<Response>? getRequest(String url);
  Future<Response>? postRequest(String url, Map body);
}
