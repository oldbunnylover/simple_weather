import 'package:flutter/material.dart';

class WeatherInfoTemp extends StatelessWidget {
  static const _tempTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 80,
    height: 1,
  );
  static const _descTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  final int temp;
  final String? desc;

  const WeatherInfoTemp({
    super.key,
    required this.temp,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$temp',
          style: _tempTextStyle,
        ),
        if (desc?.isNotEmpty == true)
          Text(
            desc!,
            style: _descTextStyle,
          ),
      ],
    );
  }
}
