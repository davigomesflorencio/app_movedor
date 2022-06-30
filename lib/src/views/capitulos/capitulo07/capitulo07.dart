import 'dart:developer' as dev;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Capitulo07 extends StatefulWidget {
  const Capitulo07({Key? key}) : super(key: key);

  @override
  State<Capitulo07> createState() => _Capitulo07State();
}

class _Capitulo07State extends State<Capitulo07> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _charDialog(
          imagePath: 'assets/infografico/rosto.png',
          title: 'Seja bem-vindo ao MoveDor!',
          content: const Text(
              'Através deste infográfico interativo você poderá ter '
              'acesso a informações confiáveis baseadas em estudos científicos, '
              'profissionais da saúde e pacientes com dor lombar que lhe ajudarão a '
              'gerenciar essa condição de forma prática e divertida! Então, se você '
              'tem dor na região mais baixa das costas a mais de três meses este '
              'infográfico poderá lhe ajudar!'),
        );

        await _charDialog(
          imagePath: 'assets/infografico/board.png',
          title: 'Interaja com os elementos!',
          content: const Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(text: 'Para utilizar o Infográfico, '),
              TextSpan(
                text:
                    'clique nos personagens e elementos presentes na tela!\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: 'Essa é uma iniciativa do '),
              TextSpan(
                text: 'Projeto Movimento do Departamento de Fisioterapia ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: 'em parceria com o curso de '),
              TextSpan(
                text:
                    'Sistemas e Mídias Digitais da Universidade Federal do Ceará',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                  text: ', juntamento com o Instituto Federal de Educação, '
                      'Ciência e Tecnologia do Ceará com apoio do '),
              TextSpan(
                text: 'PIBITI.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/infografico/bg.png',
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Stack(
            children: [
              Image.asset(
                'assets/infografico/board.png',
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(-0.09, -0.05),
                  child: Container(
                    child: const FractionallySizedBox(
                      heightFactor: 0.13,
                      widthFactor: 0.06,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () {
                  dev.log('clicou no jogador', name: 'info: ');
                  var _imagePath = 'assets/infografico/basquete.png';
                  var _title = 'O melhor exercício é aquele que você gosta!';
                  var _content = const Text(
                      'A ciência não mostra que um tipo de exercício é melhor '
                      'que outro em pessoas com dor lombar. Escolha o tipo de '
                      'exercício pensando em suas necessidades, preferências e '
                      'capacidades. Você pode sentir dor ou incômodo ao iniciar '
                      'os exercícios.\n\n'
                      'Não se preocupe. Em geral, isso passa com a prática!');
                  _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(-0.77, -0.15),
                  child: Container(
                    child: const FractionallySizedBox(
                      heightFactor: 0.15,
                      widthFactor: 0.07,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () {
                  dev.log('clicou no homem triste', name: 'info: ');
                  var _imagePath = 'assets/infografico/triste.png';
                  var _title = 'Com dor!';
                  var _content = const Text('A dor lombar persistente pode '
                      'afetar negativamente suas atividades do dia a dia. Mas não '
                      'fique desanimado: o movimento pode lhe ajudar!');

                  _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(0.2, -0.7),
                  child: Container(
                    child: const FractionallySizedBox(
                      heightFactor: 0.12,
                      widthFactor: 0.12,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () {
                  dev.log('clicou na Ginasta', name: 'info: ');
                  var _imagePath = 'assets/infografico/ginasta.png';
                  var _title = 'Retorne aos movimentos aos poucos!';
                  var _content = const Text(
                      'Se você já sentiu dor ao fazer um determinado '
                      'movimento, o seu corpo pode guardar esta informação como '
                      'uma memória ruim associada ao movimento. Isso pode levar '
                      'a comportamentos como evitar uma atividade, colaborando '
                      'para a persistência da dor e da incapacidade. O movimento '
                      'pode romper esse ciclo! Inicie por um movimento mais '
                      'fácil e avance para um mais difícil. Respeite os limites '
                      'de seu corpo.');

                  _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(0.4, -0.12),
                  child: Container(
                    child: const FractionallySizedBox(
                      heightFactor: 0.14,
                      widthFactor: 0.07,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () {
                  dev.log('clicou no homem correndo', name: 'info: ');
                  var _imagePath = 'assets/infografico/corre.png';
                  var _title =
                      'A caminhada é indicada para pessoas com Dor Lombar Persistente!';
                  var _content = const Text(
                      'A caminhada é um exercício simples, '
                      'gratuito, de baixo impacto físico e com ganhos importantes '
                      'para pessoas com dor crônica. Você nunca caminhou ou não faz '
                      'nenhum exercício físico? Comece caminhando 10 minutos. Aumente '
                      'esse tempo aos poucos com o passar das semanas, de acordo com '
                      'seus limites.\n\n'
                      'Antes de começar: alimente-se bem, use roupas leves e tênis '
                      'ou algum outro calçado confortável.');

                  _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(-0.5, -0.28),
                  child: Container(
                    child: const FractionallySizedBox(
                      heightFactor: 0.12,
                      widthFactor: 0.07,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () {
                  dev.log('clicou na velhinha', name: 'info: ');
                  _charDialog(
                    imagePath: 'assets/infografico/idosa.png',
                    title:
                        'O movimento é o melhor aliado para melhorar a Dor Lombar!',
                    content: const Text('Sim, é seguro se movimentar!\n\n'
                        'O repouso ou apenas tratamentos passivos não são recomendados '
                        'para melhorar da dor lombar. Continue desempenhando suas '
                        'atividades do dia a dia. Continue envolvido no trabalho. '
                        'Realize atividades de lazer. Faça tratamento com exercícios '
                        'físicos!'),
                  );
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(0.95, -0.39),
                  child: Container(
                    child: const FractionallySizedBox(
                      widthFactor: 0.2,
                      heightFactor: 0.3,
                    ),
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                onTap: () async {
                  dev.log('clicou no hospital', name: 'info: ');
                  var _imagePath = 'assets/infografico/posto.png';
                  var _title = 'Conte com o apoio da equipe de saúde!';
                  var _content = const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Os profissionais de saúde da '),
                        TextSpan(
                            text: 'Unidade Básica de Saúde(UBS) ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'mais próxima da sua casa poderão ajudá-lo no '
                                'planejamento e progressão da intensidade dos '
                                'exercícios físicos. Existem vários grupos de '
                                'exercícios nos postos de saúde. Veja quais '
                                'são as opções mais próximas e as que você '
                                'prefere.'),
                      ],
                    ),
                  );

                  await _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);

                  _imagePath = 'assets/infografico/mapa.png';
                  _content = Text.rich(TextSpan(children: <TextSpan>[
                    const TextSpan(
                        text: 'Na presença de sinais como febre, perda de '
                            'peso não intencional, diminuição de força muscular '
                            'nas pernas, perda de sensibilidade progressiva, '
                            'dores constantes ou experiência com eventos '
                            'traumáticos graves, procure da equipe de saúde. '
                            'Não se esqueça, há sempre alguém pronto para te '
                            'ajudar!\n\n'),
                    TextSpan(
                      text: 'Clique aqui para localizar as UBS '
                          'mais próximas',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await MapsLauncher.launchQuery('UBS próxima a mim');
                        },
                    ),
                  ]));

                  await _charDialog(
                      imagePath: _imagePath, title: _title, content: _content);
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(1, -1),
          child: IconButton(
            iconSize: 70,
            icon: const Icon(
              Icons.info,
              color: Colors.green,
            ),
            onPressed: () => _charDialog(
              imagePath: 'assets/infografico/team.png',
              title: 'Informações',
              content: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Esse infográfico é resultado de uma parceria '
                            'entre os cursos de Fisioterapia e Sistemas e Mídias '
                            'Digitais, da Universidade Federal do Ceará.\n'),
                    TextSpan(
                        text: 'Orientadoras: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Ana Carla Lima Nunes e Fabianna Resende de '
                            'Jesus Moraleida.\n'),
                    TextSpan(
                        text: 'Alunos: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text:
                            'Ana Eloise Ferreira Neves, Andreza Deyse Leal de '
                            'Sousa, Alice Fortes Pereira, Arthur Anthunes Rangel da '
                            'Silva, Isaac Santos Félix, Mardeson Herculano Acácio e '
                            'Narciso Ferreira de Menezes Filho.\n'),
                    TextSpan(
                        text: 'Imagens adicionais: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Designed by pikisuperstar & '
                            'rawpixel.com / Freepik. (www.freepik.com)\n'),
                    TextSpan(
                        text:
                            'Universidade Federal do Ceará - Todos os direitos reservados',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  _charDialog(
      {required String imagePath,
      required String title,
      required Widget content}) {
    var _imageHeight = MediaQuery.of(context).size.height * 0.2;

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Image.asset(
                    imagePath,
                    height: _imageHeight,
                  ),
                  Text(
                    title,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  content
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
