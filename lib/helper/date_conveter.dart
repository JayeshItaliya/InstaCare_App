import 'package:intl/intl.dart';

class DateConverter {

  static String formatDate(DateTime dateTime) {
    return DateFormat('d MMMM yyyy').format(dateTime);
  }
}