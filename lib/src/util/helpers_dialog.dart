import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class HelpersDialog {
  static Future<dynamic> showDialogConclusion(
    BuildContext context,
    String title,
    String content,
    String nameButton,
    Function() func,
  ) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleMovedor.secondTextStyleAzul,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            ButtomWidget(
              texto: nameButton,
              onPress: func,
              textColor: CoresMovedor.textoBotaoCor,
              botaoColor: CoresMovedor.primary,
              habilitarBotao: true,
            ),
          ],
        ),
        actions: [],
      ),
    );
  }

  static Future<dynamic> showDialogExcluirAtividade(
    BuildContext context,
    String title,
    String content,
    String nameButton,
    Function() func,
  ) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleMovedor.secondTextStyleAzul,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          textStyle: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CoresMovedor.primary,
                        ),
                        onPressed: func,
                        child: const Text(
                          "Excluir",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [],
      ),
    );
  }

  static Future<dynamic> watchShowDialog(
    BuildContext context,
    String text,
  ) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Aviso',
          textAlign: TextAlign.center,
          style: TextStyleMovedor.secondTextStyleAzul,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 40,
                    child: ButtomWidget(
                      texto: "OK",
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      textColor: CoresMovedor.textoBotaoCor,
                      botaoColor: CoresMovedor.primary,
                      habilitarBotao: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
