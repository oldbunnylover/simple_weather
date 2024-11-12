import 'package:dio/dio.dart';
import 'package:simple_weather/core/core.dart';

import 'api/home_api.dart';

class HomeRepo {
  final HomeApi api = HomeApi(
    dio: Dio(),
    baseUrl: BuildConfig.apiBaseUrl,
    apiKey: BuildConfig.apiKey,
  );

  static HomeRepo? _instance;
  factory HomeRepo() => _instance ??= HomeRepo._();
  HomeRepo._();
}