import 'package:aplicacao/src/models/questionario_atividade_fisica.dart';
import 'package:aplicacao/src/repository/interfaces/questionario_atividade_fisica_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtividadeFisicaRepositoryImpl extends Disposable
    implements IAtividadeFisicaRepository {
  AtividadeFisicaRepositoryImpl();

  @override
  Future delete(QuestionarioAtividadeFisica model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<QuestionarioAtividadeFisica>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_ATIV_FISICAS)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => QuestionarioAtividadeFisica.fromDocument(doc))
            .toList());
  }

  @override
  Future<QuestionarioAtividadeFisica> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_ATIV_FISICAS)
        .doc(documentId)
        .get();
    return QuestionarioAtividadeFisica.fromDocument(_doc);
  }

  @override
  Future save(QuestionarioAtividadeFisica model) async {
    await model.save();
  }
}
