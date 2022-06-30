import 'package:aplicacao/src/models/questionario_periodico.dart';

abstract class IQuestionarioPeriodicoRepository {
  Stream<List<QuestionarioPeriodico>> get();
  Future save(QuestionarioPeriodico model);
  Future delete(QuestionarioPeriodico model);
  Future<QuestionarioPeriodico?> getByDocumentId(String documentId);
}
