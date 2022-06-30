import 'package:aplicacao/src/views/components/colors.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final String texto;
  const LogoText({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo_sem_nome.png",
          width: size.width * 0.20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CoresMovedor.textoPadrao,
                fontSize: size.height * 0.025,
              ),
            ),
            Text(
              "MoveDor",
              style: TextStyle(
                color: CoresMovedor.textoPadrao,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.042,
              ),
            ),
          ],
        )
      ],
    );
  }
}
