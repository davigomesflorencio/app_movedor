import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final double groupValue;
  final Function(double) onPressed;
  final String texto;
  final double val;
  const RadioButtonWidget({
    Key? key,
    required this.groupValue,
    required this.onPressed,
    required this.texto,
    required this.val,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<double>(
          value: val,
          groupValue: groupValue,
          toggleable: true,
          onChanged: (value) {
            onPressed(value!);
          },
        ),
        Text(
          texto,
        ),
      ],
    );
  }
}
