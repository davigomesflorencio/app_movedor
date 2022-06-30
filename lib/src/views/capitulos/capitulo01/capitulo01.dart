import 'dart:developer' as dev;

import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Capitulo01 extends StatefulWidget {
  const Capitulo01({Key? key}) : super(key: key);
  @override
  _Capitulo01State createState() => _Capitulo01State();
}

class _Capitulo01State extends State<Capitulo01> {
  late VideoPlayerController _controller;
  bool hasTheVideoFinished = false;
  bool isControlsVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/cap1.mp4')
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

  Future<dynamic> watchUtilTheEndWarningShowDialog(BuildContext context) async {
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

  Widget videoControlsWidget() {
    return Stack(
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

  Widget landscapePage() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: Colors.black,
      body: videoWidget(),
    );
  }

  Widget portraitPage(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conceitos básicos',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            child: videoWidget(),
          ),
          const Text(
            'Descrição',
            style: TextStyleMovedor.primaryTextStyleAzul,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'Nesse capítulo você aprenderá os conceitos básicos de Dor Lombar Crônica (DLC)',
              style: TextStyleMovedor.secondaryTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          hasTheVideoFinished
              ? ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/home'),
                  child: const Text('Concluir'))
              : ElevatedButton(
                  onPressed: () => watchUtilTheEndWarningShowDialog(context),
                  child: const Text('Concluir'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                )
        ],
      ),
    );
  }
}
