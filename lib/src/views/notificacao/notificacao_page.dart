import 'package:aplicacao/src/controllers/notificacao_controller.dart';
import 'package:aplicacao/src/models/notificacao_date.dart';
import 'package:aplicacao/src/util/helpers_date.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({Key? key}) : super(key: key);

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  NotificacaoController notificacaoController = Get.find();

  @override
  void initState() {
    super.initState();
    notificacaoController.getListNotificacaoDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            if (!notificacaoController.possuiNotificacao.value) {
              return const SizedBox();
            }
            return itemNotificacaoNaoLida();
          }),
          Obx(() {
            if (notificacaoController.editavel.value == true &&
                notificacaoController.listNotificacaoDate.isNotEmpty) {
              return itemNotificacaoEditar(
                  notificacaoController.listNotificacaoDate[0]);
            }
            return const SizedBox();
          }),
          Flexible(
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: notificacaoController.listNotificacaoDate.length,
                itemBuilder: (BuildContext context, int index) {
                  // return Text("ola");
                  return itemNotificacaoLida(
                      notificacaoController.listNotificacaoDate[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Container itemNotificacaoEditar(NotificacaoDate notificacaoDate) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                "assets/images/note_edit.png",
                width: 35,
                height: 35,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Edite aqui o questionário mensal"),
                  const Divider(),
                  Text(notificacaoDate.data),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemNotificacaoLida(NotificacaoDate notificacaoDate) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                "assets/images/file_check.png",
                width: 35,
                height: 35,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Questionário mensal respondido em"),
                  const Divider(),
                  Text(notificacaoDate.data),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell itemNotificacaoNaoLida() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/questionarioPeriodico");
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CoresMovedor.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/note_edit.png",
                  width: 35,
                  height: 35,
                  color: CoresMovedor.primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Responda aqui o questionário mensal"),
                      const Divider(),
                      Text(HelpersDate.getStringDateNowHour()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
