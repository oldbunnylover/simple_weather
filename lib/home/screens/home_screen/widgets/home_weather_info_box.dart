import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/data.dart';
import 'weather_info_box_line.dart';
import 'weather_info_temp.dart';

class HomeWeatherInfoBox extends StatelessWidget {
  static const TextStyle _dateTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  final Forecast forecast;

  const HomeWeatherInfoBox({
    super.key,
    required this.forecast,
  });

  String get currentDate => DateFormat.MMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Today, $currentDate',
              style: _dateTextStyle,
            ),
            SizedBox(height: 24),
            WeatherInfoTemp(
              temp: forecast.tempInfo.temp.round(),
              desc: forecast.weatherInfoList.firstOrNull?.main,
            ),
            SizedBox(height: 24),
            WeatherInfoBoxLine(
              title: 'Feels Like',
              value: '${forecast.tempInfo.feelsLike.round()}',
            ),
            WeatherInfoBoxLine(
              title: 'Wind',
              value: '${forecast.windInfo.speed.round()} km/h',
            ),
            WeatherInfoBoxLine(
              title: 'Humidity',
              value: '${forecast.tempInfo.humidity.round()} %',
            ),
          ],
        ),
      ),
    );
  }
}
