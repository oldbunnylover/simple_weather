import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_weather/app/entity/entity.dart';
import 'package:simple_weather/core/build_config.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.initial()) {
    on<AppEvent>(_mapEventToState, transformer: sequential());
    add(AppEvent.init());
  }

  City get city => state.maybeWhen(
        loaded: (city) => city,
        orElse: () => BuildConfig.cityList.first,
      );

  Future<void> _mapEventToState(
    AppEvent event,
    Emitter<AppState> emit,
  ) async {
    await event.mapOrNull(
      init: (_Init event) async => await _onInit(event, emit),
      saveCity: (_SaveCity event) async => await _onSaveCity(event, emit),
    );
  }

  Future<void> _onInit(_Init event, Emitter<AppState> emit) async {
    emit(_Loaded(city: BuildConfig.cityList.first));
  }

  Future<void> _onSaveCity(_SaveCity event, Emitter<AppState> emit) async {
    state.mapOrNull(
      loaded: (state) {
        emit(state.copyWith(city: event.city));
      },
    );
  }
}
