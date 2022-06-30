import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final String texto;
  final bool habilitarBotao;
  final Function() onPress;
  final Color textColor;
  final Color botaoColor;
  const ButtomWidget(
      {Key? key,
      required this.texto,
      required this.onPress,
      required this.textColor,
      required this.botaoColor,
      required this.habilitarBotao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: botaoColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          )),
      onPressed: habilitarBotao ? onPress : () {},
      child: habilitarBotao
          ? Text(
              texto,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6, right: 10),
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                Text(
                  "Carregando...",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
    );
  }
}
