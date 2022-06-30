import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DadosPessoais {
  String? dataNascimento;
  String? cidade;
  int? tempoEstudo;
  double? altura;
  double? peso;
  DocumentReference? reference;

  DadosPessoais(
      {this.dataNascimento = "",
      this.cidade = "",
      this.tempoEstudo = 0,
      this.altura = 0.0,
      this.peso = 0.0,
      this.reference});

  factory DadosPessoais.fromDocument(DocumentSnapshot doc) {
    return DadosPessoais(
        dataNascimento: doc[ConstantesDatabase.DATA_NASCIMENTO],
        cidade: doc[ConstantesDatabase.CIDADE],
        tempoEstudo: doc[ConstantesDatabase.TEMPO_ESTUDO],
        altura: doc[ConstantesDatabase.ALTURA],
        peso: doc[ConstantesDatabase.PESO],
        reference: doc.reference);
  }

  factory DadosPessoais.fromJson(Map<String, dynamic> json) {
    return DadosPessoais(
      dataNascimento: json[ConstantesDatabase.DATA_NASCIMENTO],
      cidade: json[ConstantesDatabase.CIDADE],
      tempoEstudo: json[ConstantesDatabase.TEMPO_ESTUDO],
      altura: json[ConstantesDatabase.ALTURA],
      peso: json[ConstantesDatabase.PESO],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantesDatabase.DATA_NASCIMENTO] = dataNascimento;
    data[ConstantesDatabase.CIDADE] = cidade;
    data[ConstantesDatabase.TEMPO_ESTUDO] = tempoEstudo;
    data[ConstantesDatabase.ALTURA] = altura;
    data[ConstantesDatabase.PESO] = peso;
    return data;
  }
}
