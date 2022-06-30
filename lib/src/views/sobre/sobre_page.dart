import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/sobre/content.md'),
      builder: (context, snapshot) {
        var content;
        if (snapshot.hasData) {
          content = Markdown(
            data: snapshot.data.toString(),
            selectable: true,
            onTapLink: (text, url, title) {
              launchUrl(Uri.parse(url!));
            },
          );
        } else {
          content = Container();
        }
        return Scaffold(
          body: content,
        );
      },
    );
  }
}
