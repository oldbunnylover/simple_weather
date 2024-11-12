import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/app/app_bloc/app_bloc.dart';
import 'package:simple_weather/home/home.dart';

// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       child: MaterialApp(
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = AppBloc();
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            home: state.maybeMap(
              loaded: (_) => HomeScreen(),
              orElse: () => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
