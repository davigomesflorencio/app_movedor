import 'package:aplicacao/src/models/questionario_sintomas.dart';
import 'package:aplicacao/src/repository/interfaces/questionario_sintomas_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SintomasRepositoryImpl extends Disposable implements ISintomasRepository {
  SintomasRepositoryImpl();

  @override
  Future delete(QuestionarioSintomas model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<QuestionarioSintomas>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_SINTOMAS)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => QuestionarioSintomas.fromDocument(doc))
            .toList());
  }

  @override
  Future<QuestionarioSintomas?> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_SINTOMAS)
        .doc(documentId)
        .get();
    return QuestionarioSintomas.fromDocument(_doc);
  }

  @override
  Future save(QuestionarioSintomas model) async {
    await model.save();
  }
}
