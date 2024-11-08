import 'package:flutter/material.dart';

class WeatherInfoBoxLine extends StatelessWidget {
  static const _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  final String title;
  final String value;

  const WeatherInfoBoxLine({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: _textStyle),
        SizedBox(width: 8),
        Text('|', style: _textStyle),
        SizedBox(width: 8),
        Text(value, style: _textStyle)
      ],
    );
  }
}
