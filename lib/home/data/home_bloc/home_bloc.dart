import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_weather/app/app_bloc/app_bloc.dart';

import '../data.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppBloc _appBloc;
  late StreamSubscription<AppState> _appBlocSub;

  HomeBloc(this._appBloc) : super(const HomeState.initial()) {
    on<HomeEvent>(_mapEventToState, transformer: sequential());
  }

  Future<void> _mapEventToState(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await event.mapOrNull(
      init: (_Init event) async => await _onInit(event, emit),
      update: (_Update event) async => await _onUpdate(event, emit),
    );

    _appBlocSub = _appBloc.stream.listen((_) => add(_Update()));
  }

  @override
  Future<void> close() async {
    await _appBlocSub.cancel();
    return super.close();
  }

  Future<void> _onInit(_Init event, Emitter<HomeState> emit) async {
    try {
      final Forecast forecast = await HomeRepo().api.fetchCurrentForecast(
            lat: _appBloc.city.lat,
            lon: _appBloc.city.lat,
          );

      emit(_Loaded(forecast: forecast));
    } catch (_) {
      emit(const _Error());
    }
  }

  Future<void> _onUpdate(_Update event, Emitter<HomeState> emit) async {
    emit(const _Initial());
  }
}
