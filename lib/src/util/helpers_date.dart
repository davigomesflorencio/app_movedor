import 'package:calendar_view/calendar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HelpersDate {
  HelpersDate._privateConstructor();

  static final HelpersDate _instance = HelpersDate._privateConstructor();

  factory HelpersDate() {
    return _instance;
  }

  static String getStringDateNowHour() {
    DateTime dateToday = DateTime.now();
    return DateFormat('dd/MM/yyyy hh:mm').format(dateToday);
  }

  static String getStringDateNow() {
    DateTime dateToday = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(dateToday);
  }

  static String converDateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String SumDayInStringDate(String data, int dia) {
    DateTime dateToday = DateFormat('dd/MM/yyyy').parse(data);
    dateToday = DateTime(dateToday.year, dateToday.month, dateToday.day + dia);
    return DateFormat('dd/MM/yyyy').format(dateToday);
  }

  static WeekDays getWeekDaysInStringDate(String data, int dia) {
    DateTime dateToday = DateFormat('dd/MM/yyyy').parse(data);
    dateToday = DateTime(dateToday.year, dateToday.month, dateToday.day + dia);
    return getWeekDay(dateToday.weekday);
  }

  static WeekDays getWeekDay(int weekday) {
    switch (weekday) {
      case 1:
        return WeekDays.monday;
      case 2:
        return WeekDays.tuesday;
      case 3:
        return WeekDays.wednesday;
      case 4:
        return WeekDays.thursday;
      case 5:
        return WeekDays.friday;
      case 6:
        return WeekDays.saturday;
      default:
        return WeekDays.sunday;
    }
  }

  static Duration convertStringToDuration(String value) {
    List<String> arr = value.split(':');
    if (arr.length == 1) {
      if (value == '60') {
        return Duration(
          hours: 1,
        );
      }
      return Duration(
        minutes: int.parse(arr[0]),
      );
    }
    return Duration(
      hours: int.parse(arr[0]),
      minutes: int.parse(arr[1]),
    );
  }

  static List<String> convertStringToListDuration(String value) {
    return value.split(':');
  }

  static String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  static DateTime convertStringDateToDateTime(String data, int dia) {
    DateTime dateConvert = DateFormat('dd/MM/yyyy').parse(data);
    dateConvert =
        DateTime(dateConvert.year, dateConvert.month, dateConvert.day + dia);
    return dateConvert;
  }

  static DateTime convertMinusStringDateToDateTime(String data, int dia) {
    DateTime dateConvert = DateFormat('dd/MM/yyyy').parse(data);
    dateConvert =
        DateTime(dateConvert.year, dateConvert.month, dateConvert.day - dia);
    return dateConvert;
  }

  static DateTime convertStringDateToDateTimeDuration(String data) {
    DateTime dateConvert = DateFormat('HH:mm').parse(data);
    dateConvert = DateTime(dateConvert.year, dateConvert.month, dateConvert.day,
        dateConvert.hour, dateConvert.minute);
    return dateConvert;
  }

  static String convertTimestampInDateTime(Timestamp timestamp) {
    DateTime dateToday =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    return DateFormat('dd/MM/yyyy hh:mm').format(dateToday);
  }

  static Timestamp getTimestampNow() {
    return Timestamp.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  static int daysBetween(Timestamp timestamp1, Timestamp timestamp2) {
    DateTime date1 =
        DateTime.fromMillisecondsSinceEpoch(timestamp1.millisecondsSinceEpoch);

    DateTime date2 =
        DateTime.fromMillisecondsSinceEpoch(timestamp2.millisecondsSinceEpoch);
    return date1.difference(date2).inDays;
  }

  static DateTime mostRecentSunday(DateTime date) =>
      DateTime(date.year, date.month, date.day - date.weekday % 7);

  static String mostRecentSundayString() {
    DateTime dateToday = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(mostRecentSunday(dateToday));
  }

  static String getDia(String dia) {
    switch (dia) {
      case '0':
        return 'Domingo';
      case '1':
        return 'Segunda';
      case '2':
        return 'Terça';
      case '3':
        return 'Quarta';
      case '4':
        return 'Quinta';
      case '5':
        return 'Sexta';
      default:
        return 'Sabádo';
    }
  }
}
