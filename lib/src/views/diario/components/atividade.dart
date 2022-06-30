import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Atividade {
  String id;
  String tipo;
  List<WeekDays> dias;
  TimeOfDay inicio;
  Duration dur;

  Atividade({
    required this.id,
    required this.tipo,
    required this.dias,
    required this.inicio,
    required this.dur,
  });

  Map<String, dynamic> toJson() {
    int hour, minute, delta_hour;
    delta_hour = 0;
    hour = this.inicio.hour;
    minute = this.inicio.minute;
    minute += this.dur.inMinutes;

    while (minute > 59) {
      minute -= 60;
      delta_hour++;
    }

    hour += delta_hour;

    while (hour > 23) {
      hour -= 24;
    }

    TimeOfDay fim = TimeOfDay(hour: hour, minute: minute);

    Map<String, dynamic> json = {
      ConstantesDatabase.ID_USUARIO: this.id,
      ConstantesDatabase.ATIV_TIPO: this.tipo,
      ConstantesDatabase.ATIV_DIA_DOMINGO: this.dias.contains(WeekDays.sunday),
      ConstantesDatabase.ATIV_DIA_SEGUNDA: this.dias.contains(WeekDays.monday),
      ConstantesDatabase.ATIV_DIA_TERCA: this.dias.contains(WeekDays.tuesday),
      ConstantesDatabase.ATIV_DIA_QUARTA:
          this.dias.contains(WeekDays.wednesday),
      ConstantesDatabase.ATIV_DIA_QUINTA: this.dias.contains(WeekDays.thursday),
      ConstantesDatabase.ATIV_DIA_SEXTA: this.dias.contains(WeekDays.friday),
      ConstantesDatabase.ATIV_DIA_SABADO: this.dias.contains(WeekDays.saturday),
      ConstantesDatabase.ATIV_HORA_INICIO: this.inicio.toString(),
      ConstantesDatabase.ATIV_DURACAO: fim.toString(),
    };

    return json;
  }

  factory Atividade.fromJson(Map<String, dynamic> json) {
    final inicio = strToTimeOfDay(json[ConstantesDatabase.ATIV_HORA_INICIO]);
    final fim = strToTimeOfDay(json[ConstantesDatabase.ATIV_DURACAO]);

    final dur = Duration(
      hours: fim.hour - inicio.hour,
      minutes: fim.minute - inicio.minute,
    );

    List<WeekDays> dias = [];
    if (json[ConstantesDatabase.ATIV_DIA_DOMINGO]) dias.add(WeekDays.sunday);
    if (json[ConstantesDatabase.ATIV_DIA_SEGUNDA]) dias.add(WeekDays.monday);
    if (json[ConstantesDatabase.ATIV_DIA_TERCA]) dias.add(WeekDays.tuesday);
    if (json[ConstantesDatabase.ATIV_DIA_QUARTA]) dias.add(WeekDays.wednesday);
    if (json[ConstantesDatabase.ATIV_DIA_QUINTA]) dias.add(WeekDays.thursday);
    if (json[ConstantesDatabase.ATIV_DIA_SEXTA]) dias.add(WeekDays.friday);
    if (json[ConstantesDatabase.ATIV_DIA_SABADO]) dias.add(WeekDays.sunday);

    return Atividade(
      id: json['id'],
      tipo: json[ConstantesDatabase.ATIV_TIPO],
      dias: dias,
      inicio: inicio,
      dur: dur,
    );
  }
}

strToTimeOfDay(String str) {
  var time = [0, 0];
  var timeStr = str.split(':');

  for (var i = 0; i < 2; i++) {
    time[i] = int.parse(timeStr[i]);
  }

  return TimeOfDay(hour: time[0], minute: time[1]);
}
