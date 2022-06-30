import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionarioSintomas {
  late String? id;

  late bool? sintomas_nenhum;
  late bool? sintomas_infeccao;
  late bool? sintomas_cancer;
  late bool? sintomas_febre;
  late bool? sintomas_perda;
  late bool? sintomas_eventos;
  late bool? sintomas_incontinencia;

  DocumentReference? reference;

  QuestionarioSintomas(
      {this.id,
      this.sintomas_nenhum,
      this.sintomas_infeccao,
      this.sintomas_cancer,
      this.sintomas_febre,
      this.sintomas_perda,
      this.sintomas_eventos,
      this.sintomas_incontinencia,
      this.reference});

  factory QuestionarioSintomas.fromDocument(DocumentSnapshot doc) {
    return QuestionarioSintomas(
      id: doc['id'],
      sintomas_nenhum: doc[ConstantesDatabase.SINTOMAS_NENHUM],
      sintomas_infeccao: doc[ConstantesDatabase.SINTOMAS_INFECCAO],
      sintomas_cancer: doc[ConstantesDatabase.SINTOMAS_CANCER],
      sintomas_febre: doc[ConstantesDatabase.SINTOMAS_FEBRE],
      sintomas_perda: doc[ConstantesDatabase.SINTOMAS_PERDA],
      sintomas_eventos: doc[ConstantesDatabase.SINTOMAS_EVENTOS],
      sintomas_incontinencia: doc[ConstantesDatabase.SINTOMAS_INCONTINENCIA],
      reference: doc.reference,
    );
  }

  factory QuestionarioSintomas.fromJson(Map<String, dynamic> json) {
    return QuestionarioSintomas(
      id: json['id'],
      sintomas_nenhum: json[ConstantesDatabase.SINTOMAS_NENHUM],
      sintomas_infeccao: json[ConstantesDatabase.SINTOMAS_INFECCAO],
      sintomas_cancer: json[ConstantesDatabase.SINTOMAS_CANCER],
      sintomas_febre: json[ConstantesDatabase.SINTOMAS_FEBRE],
      sintomas_perda: json[ConstantesDatabase.SINTOMAS_PERDA],
      sintomas_eventos: json[ConstantesDatabase.SINTOMAS_EVENTOS],
      sintomas_incontinencia: json[ConstantesDatabase.SINTOMAS_INCONTINENCIA],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[ConstantesDatabase.SINTOMAS_NENHUM] = sintomas_nenhum;
    data[ConstantesDatabase.SINTOMAS_INFECCAO] = sintomas_infeccao;
    data[ConstantesDatabase.SINTOMAS_CANCER] = sintomas_cancer;
    data[ConstantesDatabase.SINTOMAS_FEBRE] = sintomas_febre;
    data[ConstantesDatabase.SINTOMAS_PERDA] = sintomas_perda;
    data[ConstantesDatabase.SINTOMAS_EVENTOS] = sintomas_eventos;
    data[ConstantesDatabase.SINTOMAS_INCONTINENCIA] = sintomas_incontinencia;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.Q_SINTOMAS)
          .doc(id);

      await reference?.set(toJson());
    } else {
      await reference!.update(toJson());
    }
  }

  Future delete() async {
    await reference!.delete();
  }
}
