import 'package:aplicacao/src/models/historico_atividades.dart';

abstract class IHistoricoAtividadesRepository {
  Stream<List<HistoricoAtividades>> get();
  Future save(HistoricoAtividades model);
  Future delete(HistoricoAtividades model);
  Future<HistoricoAtividades?> getByDocumentId(String documentId);
}
