import 'package:aplicacao/src/models/atividades.dart';

abstract class IAtividadesRepository {
  Stream<List<Atividades>> get();
  Future save(Atividades model);
  Future delete(Atividades model);
  Future<Atividades?> getByDocumentId(String documentId);
}
