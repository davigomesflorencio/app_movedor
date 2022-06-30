import "package:aplicacao/src/util/constantes_database.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class HistoricoAtividades {
  late String? id_atividade;
  late String? id_usuario;
  late bool? fez;
  late String? motivo;
  late String? data_atividade;
  late double? tempo;
  late String? esforco;

  DocumentReference? reference;

  HistoricoAtividades({
    this.id_atividade,
    this.id_usuario,
    this.fez = false,
    this.motivo = "",
    this.data_atividade = "",
    this.tempo = 0,
    this.esforco = "",
    this.reference,
  });

  factory HistoricoAtividades.fromDocument(DocumentSnapshot doc) {
    return HistoricoAtividades(
      id_atividade: doc["id_atividade"],
      id_usuario: doc["id_usuario"],
      fez: doc[ConstantesDatabase.HISTORICO_ATIV_FEZ],
      motivo: doc[ConstantesDatabase.HISTORICO_ATIV_MOTIVO],
      data_atividade: doc[ConstantesDatabase.HISTORICO_ATIV_DATA_ATIVIDADE],
      tempo: doc[ConstantesDatabase.HISTORICO_ATIV_TEMPO],
      esforco: doc[ConstantesDatabase.HISTORICO_ATIV_ESFORCO],
      reference: doc.reference,
    );
  }

  factory HistoricoAtividades.fromJson(Map<String, dynamic> json) {
    return HistoricoAtividades(
      id_atividade: json["id_atividade"],
      id_usuario: json["id_usuario"],
      fez: json[ConstantesDatabase.HISTORICO_ATIV_FEZ],
      motivo: json[ConstantesDatabase.HISTORICO_ATIV_MOTIVO],
      data_atividade: json[ConstantesDatabase.HISTORICO_ATIV_DATA_ATIVIDADE],
      tempo: json[ConstantesDatabase.HISTORICO_ATIV_TEMPO],
      esforco: json[ConstantesDatabase.HISTORICO_ATIV_ESFORCO],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id_atividade"] = id_atividade;
    data["id_usuario"] = id_usuario;
    data[ConstantesDatabase.HISTORICO_ATIV_FEZ] = fez;
    data[ConstantesDatabase.HISTORICO_ATIV_MOTIVO] = motivo;
    data[ConstantesDatabase.HISTORICO_ATIV_DATA_ATIVIDADE] =
        this.data_atividade;
    data[ConstantesDatabase.HISTORICO_ATIV_TEMPO] = tempo;
    data[ConstantesDatabase.HISTORICO_ATIV_ESFORCO] = esforco;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.HISTORICO_ATIVIDADES)
          .doc();

      await reference!.set(toJson());
    } else {
      await reference!.update(toJson());
    }
  }

  Future update() async {
    if (reference != null) {
      await reference!.update(toJson());
    }
  }

  Future delete() async {
    await reference!.delete();
  }
}
