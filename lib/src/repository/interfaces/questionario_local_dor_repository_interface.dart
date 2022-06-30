import 'package:aplicacao/src/models/questionario_local_dor.dart';

abstract class ILocalDorRepository {
  Stream<List<QuestionarioLocalDor>> get();
  Future save(QuestionarioLocalDor model);
  Future delete(QuestionarioLocalDor model);
  Future<QuestionarioLocalDor?> getByDocumentId(String documentId);
}
