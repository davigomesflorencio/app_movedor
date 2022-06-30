import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Capitulo05 extends StatefulWidget {
  const Capitulo05({Key? key}) : super(key: key);

  @override
  State<Capitulo05> createState() => _Capitulo05State();
}

class _Capitulo05State extends State<Capitulo05> {
  @override
  Widget build(BuildContext context) {
    return Container(child: portraitPage(context));
  }

  Widget portraitPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apoio especializado',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/capitulos/cap6_illustration.png",
                  width: size.width * 0.6,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Você não está sozinho',
                  style: TextStyleMovedor.primaryTextStyleAzul,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Existem vários grupos de exercícios no posto de saúde. Veja quais são as opções mais próximas e as que você prefere.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Você sabia?',
                  style: TextStyleMovedor.primaryTextStyleAzul,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Existem vários grupos de exercícios nos postos de saúde',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Veja quais são as opções mais próximas e as que você prefere.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/capitulos/cap5_illustration.png",
                  width: size.width * 0.6,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Exercícios e atividades que promovem o relaxamento e consciência corporal são importantes para alívio da dor.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Exercícios de respiração, técnicas de relaxamento e meditação são opções que podem fazer parte do seu dia-a-dia.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtomWidget(
                  texto: "Concluir",
                  onPress: () {
                    Navigator.popAndPushNamed(context, "/home");
                  },
                  textColor: CoresMovedor.textoBotaoCor,
                  botaoColor: CoresMovedor.primary,
                  habilitarBotao: true,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
