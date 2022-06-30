import 'package:aplicacao/src/controllers/notificacao_controller.dart';
import 'package:aplicacao/src/views/capitulos/capitulo07/capitulo07.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:aplicacao/src/views/diario/diario_page.dart';
import 'package:aplicacao/src/views/home/components/drawer.dart';
import 'package:aplicacao/src/views/sobre/sobre_page.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lista_capitulos/tab_lista_capitulos.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  NotificacaoController notificacaoController = Get.find();

  int tabSelecionada = 0;

  final tabs = [
    const TabListCapitulos(),
    const Capitulo07(),
    DiarioPage(),
    const SobrePage(),
  ];

  List<Widget> createAppBarActions() {
    return [
      InkWell(
        onTap: () {
          Get.toNamed("/notificacao");
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Obx(() {
            return Badge(
              showBadge: notificacaoController.possuiNotificacao.value,
              position: BadgePosition.topEnd(top: 4, end: -4),
              badgeContent: notificacaoController.notificacaoEditavel.value &&
                      notificacaoController.possuiNotificacao.value
                  ? const Text('2')
                  : const Text('1'),
              child: const Icon(Icons.notifications),
            );
          }),
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    notificacaoController.verificarNotificacoes();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: _orientationBuilder);
  }

  Widget _orientationBuilder(context, orientation) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoveDor',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
        actions: createAppBarActions(),
      ),
      drawer: const CustomDrawer(),
      body: tabs[tabSelecionada],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabSelecionada,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: CoresMovedor.primary),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              label: "Infográfico",
              backgroundColor: CoresMovedor.primary),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: "Diário",
              backgroundColor: CoresMovedor.primary),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Sobre",
              backgroundColor: CoresMovedor.primary),
        ],
        onTap: (index) {
          setState(() {
            tabSelecionada = index;
          });
        },
      ),
    );
  }
}
