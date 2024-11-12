import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    @JsonKey(name: 'main') required TempInfo tempInfo,
    @JsonKey(name: 'weather') required List<WeatherInfo> weatherInfoList,
    @JsonKey(name: 'wind') required WindInfo windInfo,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
