import 'package:intl/intl.dart';

String formatMatchDate(DateTime dateTime) {
  final day = DateFormat('d').format(dateTime);
  final suffix = _getDaySuffix(int.parse(day));
  final date = DateFormat('MMMM yyyy').format(dateTime);
  final time = DateFormat('HH:mm').format(dateTime);
  return '$day$suffix $date KO at $time';
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) return 'th';
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
