import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/input_text.dart';
import 'package:aplicacao/src/views/termo_de_uso/termo_de_uso.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepCadastroInicial extends StatefulWidget {
  StepCadastroInicial({Key? key}) : super(key: key);

  @override
  State<StepCadastroInicial> createState() => _StepCadastroInicialState();
}

class _StepCadastroInicialState extends State<StepCadastroInicial> {
  var controller = CadastroController.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          InputTextoWidget(
            labelInput: "Nome",
            entradaController: CadastroController.instance.nomeController,
            prefixIcon: Icons.person,
            entradaTipo: TextInputType.name,
            mostrarSenha: null,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: InputTextoWidget(
              labelInput: "Email",
              entradaController: CadastroController.instance.emailController,
              prefixIcon: Icons.email_rounded,
              entradaTipo: TextInputType.emailAddress,
              mostrarSenha: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: InputTextoWidget(
              labelInput: "Senha",
              entradaController: CadastroController.instance.senhaController,
              prefixIcon: Icons.lock,
              sufixIcon: CadastroController.instance.mostrarSenha
                  ? Icons.visibility_off
                  : Icons.visibility,
              onPressIconSufix: () {
                setState(() {
                  CadastroController.instance.mostrarSenha =
                      !CadastroController.instance.mostrarSenha;
                });
              },
              entradaTipo: TextInputType.visiblePassword,
              mostrarSenha: CadastroController.instance.mostrarSenha,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: InputTextoWidget(
              labelInput: "Confirme sua senha",
              valorSenhaConfirmar:
                  CadastroController.instance.senhaController.text,
              entradaController:
                  CadastroController.instance.confirmarSenhaController,
              prefixIcon: Icons.lock,
              sufixIcon: CadastroController.instance.mostrarSenha
                  ? Icons.visibility_off
                  : Icons.visibility,
              onPressIconSufix: () {
                setState(() {
                  CadastroController.instance.mostrarSenha =
                      !CadastroController.instance.mostrarSenha;
                });
              },
              entradaTipo: TextInputType.visiblePassword,
              mostrarSenha: CadastroController.instance.mostrarSenha,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Ao se cadastrar, você concorda com nossos ',
              style: const TextStyle(
                color: CoresMovedor.textoPadrao,
              ),
              children: [
                TextSpan(
                  text: 'termos e condições de uso ',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => TermoDeUso());
                    },
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CoresMovedor.primary,
                  ),
                ),
                const TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: CoresMovedor.textoPadrao,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
