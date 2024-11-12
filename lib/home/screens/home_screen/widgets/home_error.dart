import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  static const TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  final VoidCallback onReload;

  const HomeError({
    super.key,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Error was occurred. Try to reload',
          style: _textStyle,
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Reload',
              style: _textStyle,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          onTap: onReload,
        ),
      ],
    );
  }
}
