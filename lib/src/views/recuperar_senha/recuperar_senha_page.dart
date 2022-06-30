import 'dart:developer';

import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/util/helpers_dialog.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({Key? key}) : super(key: key);

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recuperando a Senha',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Para redefinir sua senha, informe sua conta de e-mail",
                style: TextStyleMovedor.secondaryBoldTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // autofocus: true,
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: -size.width * 0.05),
                  labelText: "Email",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ButtomWidget(
                            texto: "Recuperar Senha",
                            onPress: resetarSenha,
                            textColor: CoresMovedor.textoBotaoCor,
                            botaoColor: CoresMovedor.primary,
                            habilitarBotao: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  unfocuskeyboard() {
    FocusScope.of(context).unfocus();
  }

  resetarSenha() async {
    log(emailController.value.text);
    await AuthService.authInstance
        .resetPassword(email: emailController.value.text)
        .then((value) {})
        .catchError((e) {
      HelpersDialog.showDialogConclusion(
        context,
        "MENSAGEM",
        "Foi mandando uma email para " +
            emailController.value.text +
            " para recuperar sua senha. Verifique sua caixa de entrada.",
        "OK",
        () {
          Navigator.pop(context);
          unfocuskeyboard();
          Get.offAllNamed('/signin');
        },
      );
    });
  }
}
