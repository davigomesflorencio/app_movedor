import 'package:aplicacao/src/controllers/login_controller.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/util/auth_exception.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/input_text.dart';
import 'package:aplicacao/src/views/components/logo_texto.dart';
import 'package:aplicacao/src/views/login/widgets/buttom_circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController.instance;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool _senhaVisivel = true;
  bool _botaoHabilitado = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.habilitarBotao = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            child: Column(
              children: [
                const LogoText(
                  texto: "Faça seu login no",
                ),
                Text(
                  'Entenda o que você está sentindo!',
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: CoresMovedor.textoPadrao,
                  ),
                ),
                Text(
                  'Saiba como tratar!',
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: CoresMovedor.textoPadrao,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.08),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputTextoWidget(
                          labelInput: "Email",
                          entradaController: emailController,
                          prefixIcon: Icons.email_rounded,
                          entradaTipo: TextInputType.emailAddress,
                          mostrarSenha: null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: InputTextoWidget(
                            labelInput: "Senha",
                            entradaController: senhaController,
                            prefixIcon: Icons.lock,
                            sufixIcon: _senhaVisivel
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onPressIconSufix: () {
                              setState(() {
                                _senhaVisivel = !_senhaVisivel;
                              });
                            },
                            entradaTipo: TextInputType.visiblePassword,
                            mostrarSenha: _senhaVisivel,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/recuperarSenha');
                            },
                            child: const Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CoresMovedor.primary,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.06,
                            child: ButtomWidget(
                              texto: "Login",
                              onPress: loginComEmailSenha,
                              textColor: Colors.white,
                              botaoColor: CoresMovedor.primary,
                              habilitarBotao: _botaoHabilitado,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 2,
                                width: size.width * 0.39,
                                color: Colors.black38,
                              ),
                              Text(
                                "ou",
                                style: TextStyle(fontSize: size.height * 0.022),
                              ),
                              Container(
                                height: 2,
                                width: size.width * 0.39,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtomCircularWidget(
                                color: Colors.white,
                                icon: "assets/images/login_google.png",
                                onPress: loginComGoogle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "É novo por aqui?",
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/termoDeUso");
                              },
                              child: const Text(
                                "Crie sua conta",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CoresMovedor.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  unfocuskeyboard() {
    FocusScope.of(context).unfocus();
  }

  loginComEmailSenha() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _botaoHabilitado = !_botaoHabilitado;
      });
      try {
        final user = await AuthService.authInstance.loginComEmailSenha(
          emailController.text,
          senhaController.text,
        );
        unfocuskeyboard();
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Falha ao efetuar a autenticação!'),
            ),
          );
        }
      } on AuthException catch (e) {
        unfocuskeyboard();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: Text(e.message),
          ),
        );
      } finally {
        setState(() {
          _botaoHabilitado = !_botaoHabilitado;
        });
      }
    }
  }

  Future<void> loginComGoogle() async {
    try {
      await AuthService.authInstance.loginGooole();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(e.toString()),
        ),
      );
    }
  }
}
