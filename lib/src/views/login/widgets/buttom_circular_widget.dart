import 'package:flutter/material.dart';

class ButtomCircularWidget extends StatelessWidget {
  final Color color;
  final String icon;
  final Function() onPress;
  const ButtomCircularWidget(
      {Key? key,
      required this.color,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        child: Image.asset(
          icon,
        ),
        height: 50,
      ),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: const CircleBorder(),
      ),
    );
  }
}
