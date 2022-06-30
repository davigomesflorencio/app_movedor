import 'package:aplicacao/src/models/questionario_atividade_fisica.dart';

abstract class IAtividadeFisicaRepository {
  Stream<List<QuestionarioAtividadeFisica>> get();
  Future save(QuestionarioAtividadeFisica model);
  Future delete(QuestionarioAtividadeFisica model);
  Future<QuestionarioAtividadeFisica?> getByDocumentId(String documentId);
}
