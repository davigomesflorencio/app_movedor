import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/models/atividades.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/diario/components/tipo_dia.dart';
import 'package:aplicacao/src/views/diario/widgets/icons_atividade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiarioPage extends StatefulWidget {
  const DiarioPage({Key? key}) : super(key: key);

  @override
  State<DiarioPage> createState() => _DiarioPage();
}

class _DiarioPage extends State<DiarioPage>
    with SingleTickerProviderStateMixin {
  int diaDaSemana = DateTime.now().weekday % 7;
  Color corDesativada = Color.fromARGB(255, 196, 196, 196);
  Color corOn = Colors.white;

  AtividadesController atividadesController = Get.find();

  late TabController _tabController;

  final List<String> dias = ["DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB"];

  late List<Tab> tabsDiario = List.generate(
    7,
    (index) => Tab(
      child: TextButton(
        onPressed: () {},
        child: Text(
          dias[index],
          style: TextStyle(
            color: VerificarDia(index) != TipoDia.HOJE
                ? Colors.grey
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          shape: CircleBorder(
            side: BorderSide(
              width: 2,
              color: VerificarDia(index) == TipoDia.HOJE
                  ? CoresMovedor.primary
                  : Colors.grey,
            ),
          ),
          backgroundColor: ColorBorderContainerTipoDia(index),
        ),
      ),
    ),
  );

  @override
  void initState() {
    _tabController = new TabController(length: tabsDiario.length, vsync: this);
    super.initState();
    atividadesController.buscarAtividadesDoUsuario();
    for (int i = 0; i <= 6; i++) {
      atividadesController.corOf.add(CoresMovedor.primary);
      atividadesController.atividadeBordas.add(CoresMovedor.primary);
      atividadesController.atividadeBox.add(Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: createFabButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TabBar(
              unselectedLabelColor: Colors.black,
              // labelColor: Colors.red,
              isScrollable: true,
              tabs: tabsDiario,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                createContainerDayWeek(0),
                createContainerDayWeek(1),
                createContainerDayWeek(2),
                createContainerDayWeek(3),
                createContainerDayWeek(4),
                createContainerDayWeek(5),
                createContainerDayWeek(6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createFabButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            child: Icon(Icons.checklist_rtl),
            onPressed: () {
              Get.toNamed('/feedback');
            },
            heroTag: null,
          ),
        ),
        SizedBox(),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed('/criarAtividade');
          },
          heroTag: null,
        )
      ],
    );
  }

  FloatingActionButton createFabButtonDayWeek(
      String dayweek, int dayColor, int diaSemana) {
    return FloatingActionButton.small(
      heroTag: null,
      child: Text(
        dayweek,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: VerificarDia(dayColor) == TipoDia.HOJE
              ? CoresMovedor.primary
              : Colors.grey,
        ),
      ),
      shape: new CircleBorder(
        side: BorderSide(
          width: 2,
          color: VerificarDia(dayColor) == TipoDia.HOJE
              ? CoresMovedor.primary
              : Colors.grey,
        ),
      ),
      elevation: 0.0,
      backgroundColor: ColorContainerTipoDia(dayColor),
      onPressed: () {
        Get.toNamed('/editarDia', arguments: [diaSemana]);
      },
    );
  }

  Container createContainerDayWeek(int diaSemana) {
    return Container(
      margin: const EdgeInsets.all(
        10.0,
      ), //alignment: Alignment.center,
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: AtividadesDaSemana(diaSemana),
          ),
        );
      }),
    );
  }

  List<Widget> AtividadesDaSemana(int dia) {
    Icon iconAtividade;
    List<Widget> atividadesDoDia = [];
    List<Atividades> listaDeAtividades = [];

    switch (dia) {
      case 0:
        listaDeAtividades = atividadesController.AtividadesDomingo();
        break;
      case 1:
        listaDeAtividades = atividadesController.AtividadesSegunda();
        break;
      case 2:
        listaDeAtividades = atividadesController.AtividadesTerca();
        break;
      case 3:
        listaDeAtividades = atividadesController.AtividadesQuarta();
        break;
      case 4:
        listaDeAtividades = atividadesController.AtividadesQuinta();
        break;
      case 5:
        listaDeAtividades = atividadesController.AtividadesSexta();
        break;
      case 6:
        listaDeAtividades = atividadesController.AtividadesSabado();
        break;
    }

    for (int i = 0; i != listaDeAtividades.length; i++) {
      iconAtividade = IconAtividade(
        listaDeAtividades[i].tipo_atividade.toString(),
      );
      var atividade = InkWell(
        onTap: () {
          atividadesController.setarValoresNoController(listaDeAtividades[i]);
          Get.toNamed('/editarAtividade');
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12.0),
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorBorderContainerTipoDia(dia),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: ColorContainerTipoDia(dia),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Row(
                children: [
                  iconAtividade,
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listaDeAtividades[i].tipo_atividade.toString(),
                        ),
                        Divider(),
                        Text(
                          listaDeAtividades[i].hora_inicio.toString() +
                              ' - Duração : ' +
                              listaDeAtividades[i]
                                  .duracao
                                  .toString()
                                  .toString() +
                              ' minutos',
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: ColorContainerTipoDia(dia),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      atividadesDoDia.add(atividade);
    }

    if (atividadesDoDia.isNotEmpty) {
      return atividadesDoDia;
    } else {
      atividadesDoDia.add(NenhumaAtividade(dia));
      return atividadesDoDia;
    }
  }

  Icon IconAtividade(String tipoAtividade) {
    Icon returnIcon;
    switch (tipoAtividade) {
      case 'Exercícios aeróbicos':
        returnIcon = IconsAtividade().iconCaminhada;
        break;
      case 'Exercícios de fortalecimento':
        returnIcon = IconsAtividade().iconAcademia;
        break;
      case 'Exercícios ou técnicas de relaxamento':
        returnIcon = IconsAtividade().iconAlongamento;
        break;
      case 'Exercícios aquáticos':
        returnIcon = IconsAtividade().iconNatacao;
        break;
      case 'Ioga, tai chi chuan':
        returnIcon = IconsAtividade().iconAlongamento;
        break;
      case 'Dança':
        returnIcon = IconsAtividade().iconDanca;
        break;
      default:
        returnIcon = IconsAtividade().iconVazio;
    }
    return returnIcon;
  }

  Widget NenhumaAtividade(int dia) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 12.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: VerificarDia(dia) == TipoDia.HOJE
              ? CoresMovedor.primary
              : VerificarDia(dia) == TipoDia.NAOPASSOU
                  ? Colors.white
                  : corDesativada,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: ColorContainerTipoDia(dia),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconsAtividade().iconVazio,
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text('Nenhum Evento'),
                    Divider(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TipoDia VerificarDia(int dia) {
    if (dia == diaDaSemana) return TipoDia.HOJE;
    if (dia < diaDaSemana) return TipoDia.PASSOU;
    return TipoDia.NAOPASSOU;
  }

  Color ColorContainerTipoDia(int dia) {
    switch (VerificarDia(dia)) {
      case TipoDia.HOJE:
        return Colors.white;
      case TipoDia.PASSOU:
        return corDesativada;
      default:
        return Colors.white;
    }
  }

  Color ColorBorderContainerTipoDia(int dia) {
    switch (VerificarDia(dia)) {
      case TipoDia.HOJE:
        return CoresMovedor.primary;
      case TipoDia.PASSOU:
        return corDesativada;
      default:
        return Colors.white;
    }
  }
}
