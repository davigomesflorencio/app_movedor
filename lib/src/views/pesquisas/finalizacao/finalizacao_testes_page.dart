import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FinalizacaoTestesPage extends StatelessWidget {
  int acertos;

  FinalizacaoTestesPage({Key? key, required this.acertos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesquisa',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                okAnimation(),
                pointsMessage(context),
                const SizedBox(
                  height: 20,
                ),
                thanksMessage(),
                const SizedBox(
                  height: 20,
                ),
                goOnMessage(),
                const SizedBox(
                  height: 40,
                ),
                goOnButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LottieBuilder okAnimation() {
    return LottieBuilder.asset(
      'assets/animations/check_animation.json',
      repeat: false,
      fit: BoxFit.scaleDown,
    );
  }

  ElevatedButton goOnButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
      child: const Text(
        'Continuar',
        style: TextStyleMovedor.floatingButtonTextStyle,
      ),
    );
  }

  Text goOnMessage() {
    return const Text(
      'Agora você pode continuar a usar o App.',
      textAlign: TextAlign.center,
      style: TextStyleMovedor.primaryTextStyle,
    );
  }

  Text pointsMessage(BuildContext context) {
    return Text(
      'Você acertou ' + acertos.toString() + '/8 perguntas do teste',
      textAlign: TextAlign.center,
      style: TextStyleMovedor.primaryTextStyle,
    );
  }

  Text thanksMessage() {
    return const Text(
      'Muito Obrigado!',
      style: TextStyleMovedor.primaryTextStyle,
    );
  }
}
