import 'package:aplicacao/src/models/questionario_local_dor.dart';
import 'package:aplicacao/src/repository/interfaces/questionario_local_dor_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LocalDorRepositoryImpl extends Disposable implements ILocalDorRepository {
  LocalDorRepositoryImpl();

  @override
  Future delete(QuestionarioLocalDor model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<QuestionarioLocalDor>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_LOCAL_DOR)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => QuestionarioLocalDor.fromDocument(doc))
            .toList());
  }

  @override
  Future<QuestionarioLocalDor> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.Q_LOCAL_DOR)
        .doc(documentId)
        .get();
    return QuestionarioLocalDor.fromDocument(_doc);
  }

  @override
  Future save(QuestionarioLocalDor model) async {
    await model.save();
  }
}
