import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'dart:developer' as dev;

class Capitulo04 extends StatefulWidget {
  const Capitulo04({Key? key}) : super(key: key);

  @override
  _Capitulo04State createState() => _Capitulo04State();
}

class _Capitulo04State extends State<Capitulo04> {
  late VideoPlayerController _controller;
  bool hasTheVideoFinished = false;
  bool isControlsVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/cap4.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      })
      ..addListener(() {
        dev.log("${_controller.value.position.inSeconds}",
            name: "video position");
        if (_controller.value.position.inSeconds > 130) {
          setState(() {
            hasTheVideoFinished = true;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<dynamic> watchUtilTheEndWarningShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Aviso'),
              content:
                  const Text('Você precisa concluir o vídeo para prosseguir!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      dev.log(orientation.toString(), name: "orientation");

      if (orientation == Orientation.portrait) {
        return portraitPage(context);
      } else {
        return landscapePage();
      }
    });
  }

  Widget videoWidget() {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isControlsVisible = !isControlsVisible;
              });
            },
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
        ),
        Visibility(
          visible: isControlsVisible,
          child: videoControlsWidget(),
        ),
      ],
    );
  }

  Widget videoControlsWidget() {
    return Positioned.fill(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isControlsVisible = !isControlsVisible;
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
            ),
          ),
          Center(
            child: playAndPauseButton(),
          ),
        ],
      ),
    );
  }

  IconButton playAndPauseButton() {
    return IconButton(
      onPressed: () {
        dev.log('buttom was pressed', name: 'play/pause');
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      icon: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
      iconSize: 90.0,
      color: Colors.white,
    );
  }

  Widget landscapePage() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: Colors.black,
      body: videoWidget(),
    );
  }

  Widget portraitPage(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercícios fisicos',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            videoWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text(
                'Exercício físico como tratamento',
                style: TextStyleMovedor.primaryTextStyleAzul,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text(
                'Você aprendeu que movimento é saúde, e que ele é seu maior aliado'
                ' contra dor lombar. E nesse capítulo você aprenderá como usar '
                'exercícios conforme o tratamento. Assista e veja como começar.',
                style: TextStyleMovedor.secondaryTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            hasTheVideoFinished
                ? ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed('/capitulo05'),
                    child: const Text('Concluir'))
                : ElevatedButton(
                    onPressed: () => watchUtilTheEndWarningShowDialog(context),
                    child: const Text('Concluir'),
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                  ),
          ],
        ),
      ),
    );
  }
}
