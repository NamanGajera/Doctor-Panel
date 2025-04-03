import 'package:intl/intl.dart';

import 'enums.dart';

class DateTimeFormatter {
  /// Converts time between different formats
  static String convertTime(
    String time, {
    DateFormatType from = DateFormatType.timeToTwelveHour,
    DateFormatType to = DateFormatType.twelveHourTime,
  }) {
    try {
      // Parse the input time
      DateTime parsedTime;

      // Determine input format
      if (from == DateFormatType.timeToTwelveHour) {
        // 24-hour format input
        parsedTime = DateFormat('HH:mm').parse(time);
      } else if (from == DateFormatType.timeToTwentyFourHour) {
        // 12-hour format input with AM/PM
        parsedTime = DateFormat('hh:mm a').parse(time);
      } else {
        throw const FormatException('Unsupported input format');
      }

      // Format to the desired output
      if (to == DateFormatType.twelveHourTime) {
        return DateFormat('hh:mm a').format(parsedTime);
      } else if (to == DateFormatType.timeToTwentyFourHour) {
        return DateFormat('HH:mm').format(parsedTime);
      } else {
        throw const FormatException('Unsupported output format');
      }
    } catch (e) {
      // Return original time if conversion fails
      return time;
    }
  }

  /// Converts DateTime to local time with optional timezone offset
  static DateTime toLocal(DateTime dateTime, {int? timezoneOffset}) {
    if (timezoneOffset != null) {
      // Apply custom timezone offset
      return dateTime.toLocal().add(Duration(hours: timezoneOffset));
    }
    return dateTime.toLocal();
  }

  /// Comprehensive method to format dates with multiple predefined styles
  static String format(
    dynamic date, {
    DateFormatType type = DateFormatType.standard,
    bool isUtc = false,
    String? customLocale,
    int? timezoneOffset,
  }) {
    // Handle null or empty input
    if (date == null) return '';

    // Convert input to DateTime
    DateTime dateTime = _convertToDateTime(date);

    // Convert to local time with optional timezone offset
    DateTime formattedDateTime = isUtc ? dateTime.toUtc() : toLocal(dateTime, timezoneOffset: timezoneOffset);

    // Use specified locale or default
    final locale = customLocale ?? 'en_US';

    // Special handling for ISO format
    if (type == DateFormatType.isoFormat) {
      return formattedDateTime.toIso8601String();
    }

    // Use DateFormat for other formats
    final formatter = DateFormat(
      _getFormatPattern(type),
      locale,
    );

    return formatter.format(formattedDateTime);
  }

  /// Convert various input types to DateTime
  static DateTime _convertToDateTime(dynamic date) {
    if (date is DateTime) return date;
    if (date is String) {
      try {
        return DateTime.parse(date);
      } catch (e) {
        throw FormatException('Unable to parse date: $date');
      }
    }
    throw ArgumentError('Unsupported date type: ${date.runtimeType}');
  }

  /// Get format pattern based on formatter type
  static String _getFormatPattern(DateFormatType type) {
    switch (type) {
      case DateFormatType.standard:
        return 'yyyy-MM-dd HH:mm:ss';
      case DateFormatType.shortDate:
        return 'MM/dd/yyyy';
      case DateFormatType.longDate:
        return 'MMMM dd, yyyy';
      case DateFormatType.timeOnly:
        return 'HH:mm';
      case DateFormatType.fullDateTime:
        return 'EEEE, MMMM dd, yyyy HH:mm';
      case DateFormatType.shortDateTime:
        return 'MM/dd/yy HH:mm';
      case DateFormatType.customFormat:
        return 'dd.MM.yyyy - HH:mm';
      case DateFormatType.dayMonth:
        return 'dd MMM';
      case DateFormatType.monthYear:
        return 'MMM yyyy';
      case DateFormatType.shortDayMonth:
        return 'EEE, dd MMM';
      case DateFormatType.longDayMonth:
        return 'EEEE, dd MMMM';
      case DateFormatType.yearMonthDay:
        return 'yyyy-MM-dd';
      case DateFormatType.europeanDate:
        return 'dd/MM/yyyy';
      case DateFormatType.fullMonthDate:
        return 'MMMM dd';
      case DateFormatType.timeWithSeconds:
        return 'HH:mm:ss';
      case DateFormatType.twelveHourTime:
        return 'hh:mm a';
      case DateFormatType.compactDate:
        return 'yyyyMMdd';
      case DateFormatType.weekdayShort:
        return 'EEE';
      case DateFormatType.weekdayLong:
        return 'EEEE';
      case DateFormatType.isoFormat:
        return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
      case DateFormatType.timeToTwelveHour:
        return 'HH:mm';
      case DateFormatType.timeToTwentyFourHour:
        return 'hh:mm a';
    }
  }

  /// Formats relative time with more detailed options
  static String formatRelative(
    dynamic date, {
    bool abbreviated = false,
    bool includeSeconds = false,
  }) {
    // Handle null input
    if (date == null) return '';

    // Convert input to DateTime
    DateTime dateTime = _convertToDateTime(date);

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 45) return abbreviated ? 'now' : 'just now';

    if (difference.inMinutes < 1) {
      return includeSeconds ? '${difference.inSeconds} ${abbreviated ? 'sec' : 'seconds'} ago' : (abbreviated ? 'now' : 'just now');
    }

    if (difference.inHours < 1) {
      return '${difference.inMinutes} ${abbreviated ? 'min' : 'minutes'} ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} ${abbreviated ? 'hr' : 'hours'} ago';
    }

    if (difference.inDays < 30) {
      return '${difference.inDays} ${abbreviated ? 'day' : 'days'} ago';
    }

    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }

  /// Parses a date string into a DateTime object with multiple format support
  static DateTime parse(
    String dateString, {
    List<String> formats = const [
      'yyyy-MM-dd',
      'MM/dd/yyyy',
      'dd-MM-yyyy',
      'yyyy-MM-ddTHH:mm:ss',
      'yyyy-MM-ddTHH:mm:ssZ',
    ],
  }) {
    for (var format in formats) {
      try {
        return DateFormat(format).parse(dateString);
      } catch (_) {
        continue;
      }
    }

    // Fallback to default parsing
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      throw FormatException('Unable to parse date: $dateString');
    }
  }

  /// Check if a date is today
  static bool isToday(dynamic date) {
    if (date == null) return false;

    DateTime dateTime = _convertToDateTime(date);
    final now = DateTime.now();
    return dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day;
  }

  /// Check if a date is within the last 24 hours
  static bool isWithinLast24Hours(dynamic date) {
    if (date == null) return false;

    DateTime dateTime = _convertToDateTime(date);
    final now = DateTime.now();
    return now.difference(dateTime).inHours < 24;
  }
}

// Extension methods for convenient usage
extension DateTimeFormatterExtension on DateTime {
  /// Format date using various predefined styles
  String formatDate({
    DateFormatType type = DateFormatType.standard,
    bool isUtc = false,
    String? customLocale,
    int? timezoneOffset,
  }) {
    return DateTimeFormatter.format(
      this,
      type: type,
      isUtc: isUtc,
      customLocale: customLocale,
      timezoneOffset: timezoneOffset,
    );
  }

  /// Get relative time description
  String formatRelative({
    bool abbreviated = false,
    bool includeSeconds = false,
  }) {
    return DateTimeFormatter.formatRelative(
      this,
      abbreviated: abbreviated,
      includeSeconds: includeSeconds,
    );
  }
}
