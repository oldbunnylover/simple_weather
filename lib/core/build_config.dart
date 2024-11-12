import 'package:simple_weather/app/entity/city.dart';

class BuildConfig {
  static const String apiBaseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '782a3eaec94adb9f0e1f95d71fb111ba';

  static const List<City> cityList = [
    City(name: 'Minsk', lat: 53.893009, lon: 27.567444),
    City(name: 'Brest', lat: 52.097622, lon: 23.734051),
    City(name: 'Vitebsk', lat: 55.187222, lon: 30.205116),
    City(name: 'Gomel', lat: 52.430996, lon: 30.993012),
    City(name: 'Grodno', lat: 53.669353, lon: 23.813131),
    City(name: 'Mogilev', lat: 53.898072, lon: 30.332495),
  ];
}
