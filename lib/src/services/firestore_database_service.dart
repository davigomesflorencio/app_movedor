import 'package:aplicacao/src/models/atividades.dart';
import 'package:aplicacao/src/models/historico_atividades.dart';
import 'package:aplicacao/src/models/questionario_atividade_fisica.dart';
import 'package:aplicacao/src/models/questionario_local_dor.dart';
import 'package:aplicacao/src/models/questionario_periodico.dart';
import 'package:aplicacao/src/models/questionario_sintomas.dart';
import 'package:aplicacao/src/models/usuario.dart';
import 'package:aplicacao/src/repository/atividades_repository.dart';
import 'package:aplicacao/src/repository/historico_atividades_repository.dart';
import 'package:aplicacao/src/repository/questionario_atividade_fisica_repository.dart';
import 'package:aplicacao/src/repository/questionario_local_dor_repository.dart';
import 'package:aplicacao/src/repository/questionario_periodico_repository.dart';
import 'package:aplicacao/src/repository/questionario_sintomas_repository.dart';
import 'package:aplicacao/src/repository/usuario_repository.dart';

class FirestoreDatabaseService {
  final UsuarioRepositoryImpl _usuarioRepository = UsuarioRepositoryImpl();
  final LocalDorRepositoryImpl _localdorRepository = LocalDorRepositoryImpl();
  final SintomasRepositoryImpl _sintomasRepositoryImpl =
      SintomasRepositoryImpl();
  final AtividadeFisicaRepositoryImpl _atividadeFisicaRepositoryImpl =
      AtividadeFisicaRepositoryImpl();
  final QuestionarioPeriodicoRepositoryImpl
      _questionariosPeriodicosRepositoryImpl =
      QuestionarioPeriodicoRepositoryImpl();

  final AtividadesRepositoryImpl _atividadesRepositoryImpl =
      AtividadesRepositoryImpl();
  final HistoricoAtividadesRepositoryImpl _historicoAtividadesRepositoryImpl =
      HistoricoAtividadesRepositoryImpl();

  FirestoreDatabaseService._();
  static final instance = FirestoreDatabaseService._();

  Future<Usuario?> getUser({String? uid}) async {
    Usuario? usuario = Usuario();
    await _usuarioRepository.getByDocumentId(uid!).then((value) async {
      if (value != null) {
        usuario = value;
      }
    });
    return usuario;
  }

  Future saveUser({Usuario? usuario}) async {
    if (usuario != null) {
      await _usuarioRepository.save(usuario);
    }
  }

  Future saveQuestionarioLocalDor({QuestionarioLocalDor? localDor}) async {
    if (localDor != null) {
      await _localdorRepository.save(localDor);
    }
  }

  Future<QuestionarioLocalDor?> getQuestionarioLocalDor({String? uid}) async {
    QuestionarioLocalDor? localDor;
    await _localdorRepository.getByDocumentId(uid!).then((value) async {
      if (value != null) {
        localDor = value;
      }
    });
    return localDor;
  }

  Future saveQuestionarioSintomas({QuestionarioSintomas? sintomas}) async {
    if (sintomas != null) {
      await _sintomasRepositoryImpl.save(sintomas);
    }
  }

  Future<QuestionarioSintomas?> getQuestionarioSintomas({String? uid}) async {
    QuestionarioSintomas? sintomas;
    await _sintomasRepositoryImpl.getByDocumentId(uid!).then((value) async {
      if (value != null) {
        sintomas = value;
      }
    });
    return sintomas;
  }

// Save Questionário Atividade Fisica
  Future saveQuestionarioAtividadeFisica(
      {QuestionarioAtividadeFisica? atividadeFisica}) async {
    if (atividadeFisica != null) {
      await _atividadeFisicaRepositoryImpl.save(atividadeFisica);
    }
  }

  Future<QuestionarioAtividadeFisica?> getQuestionarioAtividadeFisica(
      {String? uid}) async {
    QuestionarioAtividadeFisica? atividadeFisica;
    await _atividadeFisicaRepositoryImpl
        .getByDocumentId(uid!)
        .then((value) async {
      if (value != null) {
        atividadeFisica = value;
      }
    });
    return atividadeFisica;
  }

// Save Questionário Periodico
  Future saveQuestionariosPeriodicos(
      {QuestionarioPeriodico? questionariosPeriodicos}) async {
    if (questionariosPeriodicos != null) {
      await _questionariosPeriodicosRepositoryImpl
          .save(questionariosPeriodicos);
    }
  }

  Future<QuestionarioPeriodico?> getQuestionariosPeriodicos(
      {String? uid}) async {
    QuestionarioPeriodico? questionariosPeriodicos;
    await _questionariosPeriodicosRepositoryImpl
        .getByDocumentId(uid!)
        .then((value) async {
      if (value != null) {
        questionariosPeriodicos = value;
      }
    });
    return questionariosPeriodicos;
  }

  Future<List<QuestionarioPeriodico>?> getQuestionariosPeriodicosByUID(
      {String? uid}) async {
    List<QuestionarioPeriodico>? listQuestionariosPeriodicos = List.empty();
    await _questionariosPeriodicosRepositoryImpl
        .getByUidOrdeByTimestamp(uid!)
        .first
        .then((value) async {
      if (value != null) {
        listQuestionariosPeriodicos = value;
      }
    });
    return listQuestionariosPeriodicos;
  }

  // Save Atividades
  Future saveAtividades({Atividades? atividades}) async {
    if (atividades != null) {
      await _atividadesRepositoryImpl.save(atividades);
    }
  }

  Future<Atividades?> getAtividades({String? uid}) async {
    Atividades? atividades;
    await _atividadesRepositoryImpl.getByDocumentId(uid!).then((value) async {
      if (value != null) {
        atividades = value;
      }
    });
    return atividades;
  }

  Future<List<Atividades>?> getAtividadesPorIdUsuario({String? uid}) async {
    List<Atividades>? listAtividades = List.empty();
    await _atividadesRepositoryImpl
        .getAtividadesByUserId(
          uid!,
        )
        .first
        .then((value) async {
      if (value != null) {
        listAtividades = value;
      }
    });
    return listAtividades;
  }

  // Save Historico Atividades
  Future saveHistoricoAtividades(
      {HistoricoAtividades? historicoAtividades}) async {
    if (historicoAtividades != null) {
      await _historicoAtividadesRepositoryImpl.save(historicoAtividades);
    }
  }

  Future<HistoricoAtividades?> getHistoricoAtividades({String? id}) async {
    HistoricoAtividades? historicoAtividades;
    await _historicoAtividadesRepositoryImpl
        .getByDocumentId(id!)
        .then((value) async {
      if (value != null) {
        historicoAtividades = value;
      }
    });
    return historicoAtividades;
  }

  Future<List<HistoricoAtividades>?> getHistoricoPorIdUsuario(
      {String? uid}) async {
    List<HistoricoAtividades>? listHistoricoAtividades = List.empty();
    await _historicoAtividadesRepositoryImpl
        .getHistoricoDoUsuario(uid!)
        .first
        .then((value) async {
      if (value != null) {
        listHistoricoAtividades = value;
      }
    });
    return listHistoricoAtividades;
  }
}
