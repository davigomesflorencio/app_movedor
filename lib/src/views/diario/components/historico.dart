import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:aplicacao/src/util/helpers_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'motivos.dart';

class Historico {
  String id;
  DateTime data;
  String tipo;
  Duration dur;
  bool? fez;
  Motivos? motivo;
  int? esforco;
  bool? archivedActivity;
  String? initHour;
  DocumentReference? reference;

  Historico({
    required this.id,
    required this.data,
    required this.tipo,
    required this.dur,
    this.fez,
    this.motivo,
    this.esforco,
    this.archivedActivity,
    this.initHour,
    this.reference,
  });

  bool isEquals(Historico h) =>
      id == h.id &&
      HelpersDate.converDateTimeToString(h.data) ==
          HelpersDate.converDateTimeToString(this.data);

  Map<String, dynamic> toJson() {
    var dataf = DateFormat('dd/MM/yyyy');

    Map<String, dynamic> json = {
      "id": this.id,
      ConstantesDatabase.ATIV_TIPO: this.tipo,
      ConstantesDatabase.HISTORICO_ATIV_FEZ: this.fez,
      ConstantesDatabase.HISTORICO_ATIV_MOTIVO: this.motivo,
      ConstantesDatabase.HISTORICO_ATIV_DATA_ATIVIDADE: dataf.format(this.data),
      ConstantesDatabase.HISTORICO_ATIV_TEMPO: this.dur,
      ConstantesDatabase.HISTORICO_ATIV_ESFORCO: this.esforco,
    };
    return json;
  }

  factory Historico.fromJson(Map<String, dynamic> json) {
    var dataf = DateFormat('dd/MM/yyyy');
    var data =
        dataf.parse(json[ConstantesDatabase.HISTORICO_ATIV_DATA_ATIVIDADE]);
    return Historico(
      id: json["id"],
      tipo: json[ConstantesDatabase.ATIV_TIPO],
      fez: json[ConstantesDatabase.HISTORICO_ATIV_FEZ],
      motivo: json[ConstantesDatabase.HISTORICO_ATIV_MOTIVO],
      data: data,
      dur: json[ConstantesDatabase.HISTORICO_ATIV_TEMPO],
      esforco: json[ConstantesDatabase.HISTORICO_ATIV_ESFORCO],
    );
  }

  Future delete() async {
    await reference!.delete();
  }
}
