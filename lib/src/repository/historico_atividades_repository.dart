import 'package:aplicacao/src/models/historico_atividades.dart';
import 'package:aplicacao/src/repository/interfaces/historico_atividades_repository_interface.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoricoAtividadesRepositoryImpl extends Disposable
    implements IHistoricoAtividadesRepository {
  HistoricoAtividadesRepositoryImpl();

  @override
  Future delete(HistoricoAtividades model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<HistoricoAtividades>> get() {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.HISTORICO_ATIVIDADES)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => HistoricoAtividades.fromDocument(doc))
            .toList());
  }

  @override
  Future<HistoricoAtividades> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection(ConstantesDatabase.HISTORICO_ATIVIDADES)
        .doc(documentId)
        .get();
    return HistoricoAtividades.fromDocument(_doc);
  }

  Stream<List<HistoricoAtividades>> getHistoricoDoUsuario(String uid) {
    return FirebaseFirestore.instance
        .collection(ConstantesDatabase.HISTORICO_ATIVIDADES)
        .where("id_usuario", isEqualTo: uid)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => HistoricoAtividades.fromDocument(doc))
            .toList());
  }

  @override
  Future save(HistoricoAtividades model) async {
    await model.save();
  }
}
