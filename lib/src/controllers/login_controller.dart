import 'package:flutter/material.dart';

class LoginController {
  LoginController._privateConstructor();

  static final LoginController _instance =
      LoginController._privateConstructor();
  static LoginController get instance => _instance;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  final nomeController = TextEditingController();

  bool habilitarBotao = true;
  bool mostrarSenha = true;
}
