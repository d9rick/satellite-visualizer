import 'package:dio/dio.dart';
import 'package:flutter_sat/core/constants.dart';

class TleApi {
  final Dio _dio;

  TleApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<String> fetchTleGroup(String group) async {
    final response = await _dio.get<String>(
      AppConstants.celestrakBaseUrl,
      queryParameters: {
        'GROUP': group,
        'FORMAT': AppConstants.tleFormat,
      },
      options: Options(responseType: ResponseType.plain),
    );
    return response.data!;
  }
}
