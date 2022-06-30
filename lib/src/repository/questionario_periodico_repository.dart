import 'package:aplicacao/src/models/questionario_periodico.dart';
import 'package:aplicacao/src/repository/interfaces/questionario_periodico_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuestionarioPeriodicoRepositoryImpl extends Disposable
    implements IQuestionarioPeriodicoRepository {
  QuestionarioPeriodicoRepositoryImpl();

  @override
  Future delete(QuestionarioPeriodico model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<QuestionarioPeriodico>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_PERIODICO)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => QuestionarioPeriodico.fromDocument(doc))
            .toList());
  }

  Stream<List<QuestionarioPeriodico>> getByUidOrdeByTimestamp(String uid) {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_PERIODICO)
        .where('id', isEqualTo: uid)
        .orderBy('data', descending: true)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => QuestionarioPeriodico.fromDocument(doc))
            .toList());
  }

  @override
  Future<QuestionarioPeriodico> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_PERIODICO)
        .doc(documentId)
        .get();
    return QuestionarioPeriodico.fromDocument(_doc);
  }

  @override
  Future save(QuestionarioPeriodico model) async {
    await model.save();
  }
}
