part of 'city_bottom_sheet.dart';

Future<City?> showCityBottomSheet(BuildContext context) async {
  return showModalBottomSheet<City>(
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) => CityBottomSheet(),
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  );
}
