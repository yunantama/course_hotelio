import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    // 2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d mm yyyy', 'en_US').format(dateTime); // 5 Feb 2022
  }

  static String dateMonth(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d mm', 'en_US').format(dateTime); // 5 Feb
  }

  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '\$',
    ).format(number);
  }
}
