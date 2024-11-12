part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loaded({
    required Forecast forecast,
  }) = _Loaded;
  const factory HomeState.error() = _Error;
}
