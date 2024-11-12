import 'package:flutter/material.dart';
import 'package:simple_weather/app/entity/entity.dart';
import 'package:simple_weather/core/build_config.dart';

part 'show_city_bottom_sheet.dart';

class CityBottomSheet extends StatelessWidget {
  static const _textStyle = TextStyle(
    fontSize: 24,
  );

  const CityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Choose your city: ', style: _textStyle),
          ),
          ...BuildConfig.cityList.map(
            (city) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '${city.name}',
                    style: _textStyle,
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                onTap: () => Navigator.pop(context, city),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
