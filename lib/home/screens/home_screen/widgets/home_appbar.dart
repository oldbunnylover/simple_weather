import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/app/app_bloc/app_bloc.dart';
import 'package:simple_weather/app/entity/entity.dart';

import '../sheets/sheets.dart';
import 'home_appbar_title.dart';

class HomeAppbar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String cityName;

  const HomeAppbar({
    super.key,
    required this.cityName,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: HomeAppbarTitle(
        cityName: cityName,
        onPressed: () async {
          final City? newCity = await showCityBottomSheet(context);
          if (newCity != null)
            BlocProvider.of<AppBloc>(context).add(
              AppEvent.saveCity(newCity),
            );
        },
      ),
    );
  }
}
