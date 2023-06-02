import 'package:intl/intl.dart';

class DateConverter {

  static String formatDate(DateTime dateTime) {
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  static String dateMonthYear(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  static DateTime convertStringTimeToDate(String time) {
    return DateFormat('HH:mm').parse(time);
  }
}