import 'package:aplicacao/src/models/dados_pessoais.dart';
import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  late String? id;
  late DadosPessoais? dadosPessoais = DadosPessoais();
  late bool moduloConceitosBasicos;
  late bool moduloImportanciaMovimento;
  late bool moduloExerciciosFisicos;
  late bool moduloApoioEspecializado;
  late bool moduloTestesConhecimentos;

  DocumentReference? reference;

  Usuario(
      {this.id,
      this.dadosPessoais,
      this.reference,
      this.moduloConceitosBasicos = false,
      this.moduloImportanciaMovimento = false,
      this.moduloExerciciosFisicos = false,
      this.moduloApoioEspecializado = false,
      this.moduloTestesConhecimentos = false});

  factory Usuario.fromDocument(DocumentSnapshot doc) {
    return Usuario(
      id: doc['id'],
      dadosPessoais:
          DadosPessoais.fromJson(doc[ConstantesDatabase.DADOS_PESSOAIS]),
      moduloConceitosBasicos: doc[ConstantesDatabase.MOD_CONCEITOS_BASICOS],
      moduloImportanciaMovimento:
          doc[ConstantesDatabase.MOD_IMPORTANCIA_MOVIMENTO],
      moduloExerciciosFisicos: doc[ConstantesDatabase.MOD_EXERCICIOS_FISICOS],
      moduloApoioEspecializado: doc[ConstantesDatabase.MOD_APOIO_ESPECIALIZADO],
      moduloTestesConhecimentos:
          doc[ConstantesDatabase.MOD_TESTES_CONHECIMENTOS],
      reference: doc.reference,
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      dadosPessoais: json[ConstantesDatabase.DADOS_PESSOAIS],
      moduloConceitosBasicos: json[ConstantesDatabase.MOD_CONCEITOS_BASICOS],
      moduloImportanciaMovimento:
          json[ConstantesDatabase.MOD_IMPORTANCIA_MOVIMENTO],
      moduloExerciciosFisicos: json[ConstantesDatabase.MOD_EXERCICIOS_FISICOS],
      moduloApoioEspecializado:
          json[ConstantesDatabase.MOD_APOIO_ESPECIALIZADO],
      moduloTestesConhecimentos:
          json[ConstantesDatabase.MOD_TESTES_CONHECIMENTOS],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[ConstantesDatabase.DADOS_PESSOAIS] = dadosPessoais!.toJson();
    data[ConstantesDatabase.MOD_CONCEITOS_BASICOS] = moduloConceitosBasicos;
    data[ConstantesDatabase.MOD_IMPORTANCIA_MOVIMENTO] =
        moduloImportanciaMovimento;
    data[ConstantesDatabase.MOD_EXERCICIOS_FISICOS] = moduloExerciciosFisicos;
    data[ConstantesDatabase.MOD_APOIO_ESPECIALIZADO] = moduloApoioEspecializado;
    data[ConstantesDatabase.MOD_TESTES_CONHECIMENTOS] =
        moduloTestesConhecimentos;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance.collection("usuarios").doc(id);
      await reference?.set(toJson());
    } else {
      await reference?.update(toJson());
    }
  }

  Future delete() async {
    await reference!.delete();
  }
}
