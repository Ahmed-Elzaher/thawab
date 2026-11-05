import 'package:dio/dio.dart';
import 'package:thawab/core/networking/api_consumer.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer({required this.dio}) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }

  final Dio dio;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async => (await dio.get<dynamic>(
    path,
    queryParameters: queryParameters,
    data: _prepareData(data, isFormData),
  )).data;

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async => (await dio.post<dynamic>(
    path,
    queryParameters: queryParameters,
    data: _prepareData(data, isFormData),
  )).data;

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async => (await dio.put<dynamic>(
    path,
    queryParameters: queryParameters,
    data: _prepareData(data, isFormData),
  )).data;

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async => (await dio.delete<dynamic>(
    path,
    queryParameters: queryParameters,
    data: _prepareData(data, isFormData),
  )).data;

  Object? _prepareData(Object? data, bool isFormData) {
    if (!isFormData || data == null) return data;
    return FormData.fromMap(data as Map<String, dynamic>);
  }
}
