import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class TermoDeUsoGoogle extends StatefulWidget {
  TermoDeUsoGoogle({Key? key}) : super(key: key);
  bool isUserConcerned = false;
  @override
  State<TermoDeUsoGoogle> createState() => _TermoDeUsoGoogleState();
}

class _TermoDeUsoGoogleState extends State<TermoDeUsoGoogle> {
  Future<String> readFile() async {
    return await rootBundle.loadString('assets/termo_de_uso/content.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/termo_de_uso/content.md'),
      builder: (context, snapshot) {
        Widget content = Container();
        if (snapshot.hasData) {
          content = Markdown(
            data: snapshot.data.toString(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //selectable: true,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Termos de uso'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              content,
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Li e aceito os termos de uso.'),
                  value: widget.isUserConcerned,
                  onChanged: (_) {
                    setState(() {
                      widget.isUserConcerned = !widget.isUserConcerned;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(
                  visible: widget.isUserConcerned,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/signupGoogle");
                    },
                    child: Text('Continuar'),
                  ),
                  replacement: ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Aviso'),
                              content: Text(
                                  'Para continuar, é necessário que aceite os termos de uso!'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK')),
                              ],
                            );
                          });
                    },
                    child: Text('Continuar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
