import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(cityName: 'Minsk'),
      backgroundColor: Color(0xFF4A91FF),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 96),
            HomeWeatherInfoBox(),
            Expanded(child: SizedBox()),
            //TODO: forecast button
          ],
        ),
      ),
    );
  }
}
