import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatETB(double amount, [String locale = 'en']) {
    final symbol = locale == 'am' ? 'ብር ' : 'ETB ';
    final format = NumberFormat.currency(
      locale: locale == 'am' ? 'am_ET' : 'en_ET',
      symbol: symbol,
    );
    return format.format(amount);
  }
}
