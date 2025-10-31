import 'package:intl/intl.dart';

String formatDateRange(String start, String end) {
  try {
    final startDate = DateFormat('dd-MM-yyyy').parse(start);
    final endDate = DateFormat('dd-MM-yyyy').parse(end);

    final startMonth = DateFormat('MMM').format(startDate); // Jan
    final endMonth = DateFormat('MMM').format(endDate); // Jan
    final year = DateFormat('yyyy').format(endDate);

    if (startMonth == endMonth) {
      // Same month → Jan 16 - 20, 2024
      return '$startMonth ${startDate.day} - $endMonth ${endDate.day}, $year';
    } else {
      // Different months → Jan 30 - Feb 2, 2024
      return '$startMonth ${startDate.day} - $endMonth ${endDate.day}, $year';
    }
  } catch (e) {
    return '$start - $end'; // fallback if parsing fails
  }
}
