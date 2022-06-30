import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionarioLocalDor {
  late String? id;
  late int? local_dor_sente;
  late int? local_dor_regiao;

  DocumentReference? reference;

  QuestionarioLocalDor(
      {this.id,
      this.local_dor_sente = 0,
      this.local_dor_regiao = 0,
      this.reference});

  factory QuestionarioLocalDor.fromDocument(DocumentSnapshot doc) {
    return QuestionarioLocalDor(
      id: doc['id'],
      local_dor_regiao: doc[ConstantesDatabase.LOCAL_DOR_REGIAO],
      local_dor_sente: doc[ConstantesDatabase.LOCAL_DOR_SENTE],
      reference: doc.reference,
    );
  }

  factory QuestionarioLocalDor.fromJson(Map<String, dynamic> json) {
    return QuestionarioLocalDor(
      id: json['id'],
      local_dor_regiao: json[ConstantesDatabase.LOCAL_DOR_REGIAO],
      local_dor_sente: json[ConstantesDatabase.LOCAL_DOR_SENTE],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[ConstantesDatabase.LOCAL_DOR_SENTE] = local_dor_sente;
    data[ConstantesDatabase.LOCAL_DOR_REGIAO] = local_dor_regiao;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.Q_LOCAL_DOR)
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
