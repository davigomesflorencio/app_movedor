import 'package:aplicacao/src/models/usuario.dart';
import 'package:aplicacao/src/repository/interfaces/usuario_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioRepositoryImpl extends Disposable implements IUsuarioRepository {
  UsuarioRepositoryImpl();

  @override
  Future delete(Usuario model) async {
    await model.delete();
  }

  @override
  void dispose() {}

  @override
  Stream<List<Usuario>> get() {
    FieldValue.serverTimestamp();
    return FirebaseFirestore.instance.collection('usuarios').snapshots().map(
        (query) => query.docs.map((doc) => Usuario.fromDocument(doc)).toList());
  }

  @override
  Future<Usuario?> getByDocumentId(String documentId) async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(documentId)
        .get();
    if (_doc.data() == null) {
      return null;
    } else {
      return Usuario.fromDocument(_doc);
    }
  }

  @override
  Future save(Usuario model) async {
    await model.save();
  }
}
