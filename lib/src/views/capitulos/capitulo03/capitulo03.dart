import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class Capitulo03 extends StatefulWidget {
  const Capitulo03({Key? key}) : super(key: key);

  @override
  State<Capitulo03> createState() => _Capitulo03State();
}

class _Capitulo03State extends State<Capitulo03> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Importância do movimento',
          style: TextStyleMovedor.appBar,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                      "assets/images/capitulos/cap3_illustration.png",
                      width: _size.width * 0.8),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Movimento é saúde!',
                    style: TextStyleMovedor.primaryTextStyleAzul,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Posso me movimentar mesmo com dor? Sim, é seguro se movimentar! \n\nSe você já sentiu dor ao fazer determinado movimento, seu corpo pode guardar essa informação como uma memória ruim associada ao movimento.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                Image.asset(
                  "assets/images/capitulos/cap3-01.png",
                  width: _size.width * 0.8,
                ),
                const Text(
                  'Em algumas pessoas, essa memória pode levar a comportamentos como evitar um movimento ou uma atividade, colaborando para a persistência da dor e da incapacidade.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                Image.asset(
                  "assets/images/capitulos/cap3-02.png",
                  width: _size.width * 0.8,
                ),
                const Text(
                  'O Movimento pode romper o ciclo!',
                  style: TextStyleMovedor.primaryTextStyleAzul,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '\nVocê não precisa começar pelo movimento mais desafiador! \n \nInicie por um movimento mais fácil e simples e avance para um mais difícil.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Vá aos poucos e respeite os limites do seu corpo!',
                  style: TextStyleMovedor.primaryTextStyleAzul,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A dor pode ocorrer durante a atividade, mas não deve se manter nem aumentar após sua conclusão. \n\nAo se sentir seguro progrida aos poucos, até ganhar confiança para fazer o movimento livremente em toda a sua amplitude.',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondaryTextStyle,
                ),
                const SizedBox(
                  height: 15,
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
