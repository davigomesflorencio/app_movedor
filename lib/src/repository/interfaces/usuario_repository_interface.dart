import 'package:aplicacao/src/models/usuario.dart';

abstract class IUsuarioRepository {
  Stream<List<Usuario>> get();
  Future save(Usuario model);
  Future delete(Usuario model);
  Future<Usuario?> getByDocumentId(String documentId);
}
