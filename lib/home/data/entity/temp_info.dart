import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp_info.freezed.dart';
part 'temp_info.g.dart';

@freezed
class TempInfo with _$TempInfo {
  const factory TempInfo({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    required int pressure,
    required double humidity,
    @JsonKey(name: 'sea_level') required int seaLevel,
    @JsonKey(name: 'grnd_level') required int grndLevel,
  }) = _TempInfo;

  factory TempInfo.fromJson(Map<String, dynamic> json) =>
      _$TempInfoFromJson(json);
}
