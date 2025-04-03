import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // Format the DateTime to a readable string
  String toFormattedString({String format = 'yyyy-MM-dd'}) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }

  // Check if the DateTime is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  // Calculate the difference in days
  int daysUntil(DateTime other) => other.difference(this).inDays;

  String get formattedTime => DateFormat('hh:mm a').format(this);
  String get dayString => DateFormat('dd').format(this);
  String get weekString => DateFormat('EEE').format(this);
  String get monthString => DateFormat('MMM').format(this);
  String get shortDayString => DateFormat('EEE dd MMM').format(this);
  String get justTime => DateFormat('hh:mm a').format(this);
}