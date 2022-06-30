import 'package:aplicacao/src/views/components/colors.dart';
import 'package:flutter/material.dart';

class AppBarPesquisasWidget extends StatelessWidget {
  const AppBarPesquisasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_sem_nome.png",
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Obrigado por",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: CoresMovedor.textoPadrao),
              ),
              Text(
                "participar da nossa pesquisa!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: CoresMovedor.textoPadrao),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
