import 'package:aplicacao/src/models/atividades.dart';
import 'package:aplicacao/src/repository/interfaces/atividades_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtividadesRepositoryImpl extends Disposable
    implements IAtividadesRepository {
  AtividadesRepositoryImpl();

  @override
  Future delete(Atividades model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<Atividades>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.ATIVIDADES)
        .snapshots()
        .map((query) =>
            query.docs.map((doc) => Atividades.fromDocument(doc)).toList());
  }

  @override
  Future<Atividades> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.ATIVIDADES)
        .doc(documentId)
        .get();
    return Atividades.fromDocument(_doc);
  }

  Stream<List<Atividades>> getAtividadesByUserId(
    String uid,
  ) {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.ATIVIDADES)
        .where(ConstantesDatabase.ID_USUARIO, isEqualTo: uid)
        .snapshots()
        .map((query) =>
            query.docs.map((doc) => Atividades.fromDocument(doc)).toList());
  }

  @override
  Future save(Atividades model) async {
    await model.save();
  }
}
