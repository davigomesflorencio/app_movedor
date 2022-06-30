import 'package:aplicacao/src/models/notificacao_date.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:aplicacao/src/util/helpers_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificacaoController extends GetxController {
  late String uid;
  RxBool possuiNotificacao = false.obs;

  RxBool notificacaoEditavel = false.obs;
  RxBool editavel = false.obs;
  RxList<NotificacaoDate> listNotificacaoDate = <NotificacaoDate>[].obs;

  verificarNotificacoes() async {
    uid = AuthService.authInstance.getUID();

    FirestoreDatabaseService.instance
        .getQuestionariosPeriodicosByUID(uid: uid)
        .then(
      (value) {
        if (value!.isNotEmpty) {
          if (HelpersDate.daysBetween(
                  HelpersDate.getTimestampNow(), value[0].data) >=
              0) {
            possuiNotificacao.value = true;
          }
          if (HelpersDate.daysBetween(
                  HelpersDate.getTimestampNow(), value[0].data) <=
              1) {
            notificacaoEditavel.value = true;
          }
        }
      },
    );
  }

  getListNotificacaoDate() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listNotificacaoDate.value = RxList.empty(growable: true);
    });
    uid = AuthService.authInstance.getUID();

    await FirestoreDatabaseService.instance
        .getQuestionariosPeriodicosByUID(uid: uid)
        .then(
      (value) {
        if (value != null) {
          if (value.isNotEmpty) {
            for (var v in value) {
              if (v.data is Timestamp) {
                listNotificacaoDate.add(
                  NotificacaoDate(
                    data: HelpersDate.convertTimestampInDateTime(v.data),
                  ),
                );
              }
            }
            if (HelpersDate.daysBetween(
                    HelpersDate.getTimestampNow(), value[0].data) <=
                1) {
              editavel.value = true;
            }
          }
        }
      },
    );
  }
}
