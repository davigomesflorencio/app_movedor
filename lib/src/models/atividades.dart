import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Atividades {
  late String? id_usuario;
  late bool? domingo;
  late bool? segunda;
  late bool? terca;
  late bool? quarta;
  late bool? quinta;
  late bool? sexta;
  late bool? sabado;
  late String? tipo_atividade;
  late String? hora_inicio;
  late String? duracao;

  DocumentReference? reference;

  Atividades({
    this.id_usuario,
    this.domingo = false,
    this.segunda = false,
    this.terca = false,
    this.quarta = false,
    this.quinta = false,
    this.sexta = false,
    this.sabado = false,
    this.tipo_atividade = '',
    this.hora_inicio = '',
    this.duracao = '',
    this.reference,
  });

  factory Atividades.fromDocument(DocumentSnapshot doc) {
    return Atividades(
      id_usuario: doc[ConstantesDatabase.ID_USUARIO],
      domingo: doc[ConstantesDatabase.ATIV_DIA_DOMINGO],
      segunda: doc[ConstantesDatabase.ATIV_DIA_SEGUNDA],
      terca: doc[ConstantesDatabase.ATIV_DIA_TERCA],
      quarta: doc[ConstantesDatabase.ATIV_DIA_QUARTA],
      quinta: doc[ConstantesDatabase.ATIV_DIA_QUINTA],
      sexta: doc[ConstantesDatabase.ATIV_DIA_SEXTA],
      sabado: doc[ConstantesDatabase.ATIV_DIA_SABADO],
      tipo_atividade: doc[ConstantesDatabase.ATIV_TIPO],
      hora_inicio: doc[ConstantesDatabase.ATIV_HORA_INICIO],
      duracao: doc[ConstantesDatabase.ATIV_DURACAO],
      reference: doc.reference,
    );
  }

  factory Atividades.fromJson(Map<String, dynamic> json) {
    return Atividades(
      id_usuario: json[ConstantesDatabase.ID_USUARIO],
      domingo: json[ConstantesDatabase.ATIV_DIA_DOMINGO],
      segunda: json[ConstantesDatabase.ATIV_DIA_SEGUNDA],
      terca: json[ConstantesDatabase.ATIV_DIA_TERCA],
      quarta: json[ConstantesDatabase.ATIV_DIA_QUARTA],
      quinta: json[ConstantesDatabase.ATIV_DIA_QUINTA],
      sexta: json[ConstantesDatabase.ATIV_DIA_SEXTA],
      sabado: json[ConstantesDatabase.ATIV_DIA_SABADO],
      tipo_atividade: json[ConstantesDatabase.ATIV_TIPO],
      hora_inicio: json[ConstantesDatabase.ATIV_HORA_INICIO],
      duracao: json[ConstantesDatabase.ATIV_DURACAO],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantesDatabase.ID_USUARIO] = id_usuario;

    data[ConstantesDatabase.ATIV_DIA_DOMINGO] = domingo;
    data[ConstantesDatabase.ATIV_DIA_SEGUNDA] = segunda;
    data[ConstantesDatabase.ATIV_DIA_TERCA] = terca;
    data[ConstantesDatabase.ATIV_DIA_QUARTA] = quarta;
    data[ConstantesDatabase.ATIV_DIA_QUINTA] = quinta;
    data[ConstantesDatabase.ATIV_DIA_SEXTA] = sexta;
    data[ConstantesDatabase.ATIV_DIA_SABADO] = sabado;

    data[ConstantesDatabase.ATIV_TIPO] = tipo_atividade;
    data[ConstantesDatabase.ATIV_HORA_INICIO] = hora_inicio;
    data[ConstantesDatabase.ATIV_DURACAO] = duracao;
    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.ATIVIDADES)
          .doc();

      await reference?.set(toJson());
    } else {
      await reference!.update(toJson());
    }
  }

  Future update() async {
    if (reference != null) {
      await reference!.update(toJson());
    }
  }

  Future delete() async {
    await reference!.delete();
  }

  List<WeekDays> getDays() {
    List<WeekDays> list = List.empty(growable: true);
    if (domingo!) {
      list.add(WeekDays.sunday);
    }
    if (segunda!) {
      list.add(WeekDays.monday);
    }
    if (terca!) {
      list.add(WeekDays.tuesday);
    }
    if (quarta!) {
      list.add(WeekDays.wednesday);
    }
    if (quinta!) {
      list.add(WeekDays.thursday);
    }
    if (sexta!) {
      list.add(WeekDays.friday);
    }
    if (sabado!) {
      list.add(WeekDays.saturday);
    }
    return list;
  }
}
