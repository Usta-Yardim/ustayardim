import 'package:intl/intl.dart';

class DateHelper {
  static const Map<int, String> monthsShort = {
    1: "OCA",
    2: "ŞUB",
    3: "MAR",
    4: "NİS",
    5: "MAY",
    6: "HAZ",
    7: "TEM",
    8: "AĞU",
    9: "EYL",
    10: "EKİ",
    11: "KAS",
    12: "ARA"
  };

  static const Map<int, String> _months = {
    1: "Ocak",
    2: "Şubat",
    3: "Mart",
    4: "Nisan",
    5: "Mayıs",
    6: "Haziran",
    7: "Temmuz",
    8: "Ağustos",
    9: "Eylül",
    10: "Ekim",
    11: "Kasım",
    12: "Aralık"
  };

  static String formatDateShort({required DateTime dateTime}) {
    return "${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day} ${monthsShort[dateTime.month]}";
  }

  static String formatDateWithYearShortMonth({required DateTime dateTime}) {
    return "${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day} ${monthsShort[dateTime.month]} ${dateTime.year}";
  }

  static String formatDateWithYear({required DateTime dateTime}) {
    return "${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day} ${_months[dateTime.month]} ${dateTime.year}";
  }

  static String formatDate({required DateTime dateTime}) {
    return "${dateTime.day} ${_months[dateTime.month]}";
  }

  static String formatHours({required DateTime dateTime}) {
    DateFormat format = DateFormat("HH:mm");

    return format.format(dateTime);
  }

  static String formatDateTime({required DateTime dateTime}) {
    DateFormat format = DateFormat("dd.MM.yyyy HH:mm");

    return format.format(dateTime);
  }

  static String formatDateTimeMonth({required DateTime dateTime}) {
    return "${dateTime.day} ${_months[dateTime.month]} ${dateTime.year} ${formatHours(dateTime: dateTime)}";
  }

  static DateTime? formatApiFormat({required String date}){
    DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss");

    return formatter.parse(date);
  }

  static String formatApiToString({required DateTime dateTime}){
    DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss");

    return formatter.format(dateTime);
  }
}
