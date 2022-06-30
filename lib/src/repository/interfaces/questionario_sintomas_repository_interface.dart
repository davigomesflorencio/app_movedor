import 'package:aplicacao/src/models/questionario_sintomas.dart';

abstract class ISintomasRepository {
  Stream<List<QuestionarioSintomas>> get();
  Future save(QuestionarioSintomas model);
  Future delete(QuestionarioSintomas model);
  Future<QuestionarioSintomas?> getByDocumentId(String documentId);
}
