import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionarioAtividadeFisica {
  late String? id;
  late bool? ativ_fisica_caminhar;
  late bool? ativ_fisica_correr;
  late bool? ativ_fisica_dancar;
  late bool? ativ_fisica_nadar;
  late bool? ativ_fisica_academia;
  late bool? ativ_fisica_outras;
  late bool? ativ_fisica_nao_pratica;

  DocumentReference? reference;

  QuestionarioAtividadeFisica(
      {this.id,
      this.ativ_fisica_caminhar,
      this.ativ_fisica_correr,
      this.ativ_fisica_dancar,
      this.ativ_fisica_nadar,
      this.ativ_fisica_academia,
      this.ativ_fisica_outras,
      this.ativ_fisica_nao_pratica,
      this.reference});

  factory QuestionarioAtividadeFisica.fromDocument(DocumentSnapshot doc) {
    return QuestionarioAtividadeFisica(
      id: doc['id'],
      ativ_fisica_caminhar: doc[ConstantesDatabase.ATIV_FISICAS_CAMINHAR],
      ativ_fisica_correr: doc[ConstantesDatabase.ATIV_FISICAS_CORRER],
      ativ_fisica_dancar: doc[ConstantesDatabase.ATIV_FISICAS_DANCAR],
      ativ_fisica_nadar: doc[ConstantesDatabase.ATIV_FISICAS_NADAR],
      ativ_fisica_academia: doc[ConstantesDatabase.ATIV_FISICAS_ACADEMIA],
      ativ_fisica_outras: doc[ConstantesDatabase.ATIV_FISICAS_OUTRAS],
      ativ_fisica_nao_pratica: doc[ConstantesDatabase.ATIV_FISICAS_NAO_PRATICA],
      reference: doc.reference,
    );
  }

  factory QuestionarioAtividadeFisica.fromJson(Map<String, dynamic> json) {
    return QuestionarioAtividadeFisica(
      id: json['id'],
      ativ_fisica_caminhar: json[ConstantesDatabase.ATIV_FISICAS_CAMINHAR],
      ativ_fisica_correr: json[ConstantesDatabase.ATIV_FISICAS_CORRER],
      ativ_fisica_dancar: json[ConstantesDatabase.ATIV_FISICAS_DANCAR],
      ativ_fisica_nadar: json[ConstantesDatabase.ATIV_FISICAS_NADAR],
      ativ_fisica_academia: json[ConstantesDatabase.ATIV_FISICAS_ACADEMIA],
      ativ_fisica_outras: json[ConstantesDatabase.ATIV_FISICAS_OUTRAS],
      ativ_fisica_nao_pratica:
          json[ConstantesDatabase.ATIV_FISICAS_NAO_PRATICA],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[ConstantesDatabase.ATIV_FISICAS_CAMINHAR] = ativ_fisica_caminhar;
    data[ConstantesDatabase.ATIV_FISICAS_CORRER] = ativ_fisica_correr;
    data[ConstantesDatabase.ATIV_FISICAS_DANCAR] = ativ_fisica_dancar;
    data[ConstantesDatabase.ATIV_FISICAS_NADAR] = ativ_fisica_nadar;
    data[ConstantesDatabase.ATIV_FISICAS_ACADEMIA] = ativ_fisica_academia;
    data[ConstantesDatabase.ATIV_FISICAS_OUTRAS] = ativ_fisica_outras;
    data[ConstantesDatabase.ATIV_FISICAS_NAO_PRATICA] = ativ_fisica_nao_pratica;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.Q_ATIV_FISICAS)
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
