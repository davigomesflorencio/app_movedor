import 'package:aplicacao/src/models/usuario_drawer.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  UsuarioDrawer? usuarioDrawer;

  @override
  void initState() {
    super.initState();
    String? url = AuthService.authInstance.user!.photoURL;
    String? displayName = AuthService.authInstance.user!.displayName;
    String? email = AuthService.authInstance.user!.email;
    usuarioDrawer = UsuarioDrawer(
      nome: displayName ?? '',
      email: email!,
      photoUrl: url ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          usuarioDrawer!.photoUrl == ''
              ? UserAccountsDrawerHeader(
                  accountName: Text(usuarioDrawer!.nome),
                  accountEmail: Text(usuarioDrawer!.email),
                  currentAccountPicture: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/no_profile.png'),
                    backgroundColor: Colors.white,
                  ),
                )
              : UserAccountsDrawerHeader(
                  accountName: Text(usuarioDrawer!.nome),
                  accountEmail: Text(usuarioDrawer!.email),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(usuarioDrawer!.photoUrl),
                    backgroundColor: Colors.white,
                  ),
                ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text("Olá, seja bem vindo!"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: CoresMovedor.secondaria,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {
              Get.toNamed('/perfil');
            },
          ),
          ListTile(
            leading: const Icon(Icons.segment),
            title: const Text('Conceitos básicos'),
            onTap: () {
              Get.toNamed('/capitulo01');
            },
          ),
          ListTile(
            leading: const Icon(Icons.segment),
            title: const Text('Importância do movimento'),
            onTap: () {
              Get.toNamed('/capitulo03');
            },
          ),
          ListTile(
            leading: const Icon(Icons.segment),
            title: const Text('Exercicios Fisicos'),
            onTap: () {
              Get.toNamed('/capitulo04');
            },
          ),
          ListTile(
            leading: const Icon(Icons.segment),
            title: const Text('Apoio Especializado'),
            onTap: () {
              Get.toNamed('/capitulo05');
            },
          ),
          ListTile(
            leading: const Icon(Icons.segment),
            title: const Text('Testes seus conhecimentos'),
            onTap: () {
              Get.toNamed('/capitulo06');
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
          ListTile(
            onTap: exit,
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text('Sair'),
          )
        ],
      ),
    );
  }

  void exit() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text(
              "Tem certeza que deseja sair?",
              style: TextStyleMovedor.secondaryBoldTextStyle,
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: CoresMovedor.primary,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();

                  AuthService.authInstance.signOut();
                },
                child: const Text("Sim"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: CoresMovedor.primary,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: const Text("Não"),
              ),
            ],
          );
        });
  }
}
