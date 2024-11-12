import 'package:freezed_annotation/freezed_annotation.dart';

part 'wind_info.freezed.dart';
part 'wind_info.g.dart';

@freezed
class WindInfo with _$WindInfo {
  const factory WindInfo({
    required double speed,
    required int deg,
    required double gust,
  }) = _WindInfo;

  factory WindInfo.fromJson(Map<String, dynamic> json) =>
      _$WindInfoFromJson(json);
}
