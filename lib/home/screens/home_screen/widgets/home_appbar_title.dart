import 'package:flutter/material.dart';

class HomeAppbarTitle extends StatelessWidget {
  //TODO: select font
  static const TextStyle _titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 32,
  );

  final String cityName;
  final VoidCallback? onPressed;

  const HomeAppbarTitle({
    super.key,
    required this.cityName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.place_outlined,
            color: Colors.white,
            size: _titleTextStyle.fontSize,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            cityName,
            style: _titleTextStyle,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: _titleTextStyle.fontSize,
          ),
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      onTap: onPressed, //todo: bottomsheet
    );
  }
}
