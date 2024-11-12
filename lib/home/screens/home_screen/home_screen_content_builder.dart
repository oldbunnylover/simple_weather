import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/home/data/data.dart';

import 'widgets/widgets.dart';

class HomeScreenContentBuilder extends StatefulWidget {
  const HomeScreenContentBuilder({super.key});

  @override
  State<HomeScreenContentBuilder> createState() =>
      _HomeScreenContentBuilderState();
}

class _HomeScreenContentBuilderState extends State<HomeScreenContentBuilder> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  void didChangeDependencies() {
    _bloc.state.whenOrNull(
      initial: () => _bloc.add(const HomeEvent.init()),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        state.whenOrNull(
          initial: () => _bloc.add(const HomeEvent.init()),
        );
      },
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          appBar: HomeAppbar(cityName: 'Minsk'),
          backgroundColor: Color(0xFF4A91FF),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 96),
                state.maybeWhen(
                  loaded: (forecast) => HomeWeatherInfoBox(
                    forecast: forecast,
                  ),
                  error: () => HomeError(
                    onReload: () => _bloc.add(HomeEvent.update()),
                  ),
                  orElse: () {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        );
      },
    );
  }
}
