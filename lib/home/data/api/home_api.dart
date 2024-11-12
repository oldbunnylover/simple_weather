import 'package:dio/dio.dart';
import 'package:simple_weather/home/data/entity/entity.dart';

class HomeApi {
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  HomeApi({
    required this.dio,
    required this.baseUrl,
    required this.apiKey,
  });

  Future<Forecast> fetchCurrentForecast({
    required double lat,
    required double lon,
  }) async {
    final String url = '$baseUrl/weather';

    final Response<dynamic> response = await dio.get<dynamic>(
      url,
      queryParameters: <String, dynamic>{
        'lat': lat,
        'lon': lon,
        'appid': apiKey,
        'units': 'metric'
      },
    );

    return Forecast.fromJson(response.data);
  }
}
