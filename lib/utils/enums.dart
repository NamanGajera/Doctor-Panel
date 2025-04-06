/// Enum to define different date and time formatting types
enum DateFormatType {
  standard, // 2024-03-25 14:30:00
  shortDate, // 03/25/2024
  longDate, // March 25, 2024
  timeOnly, // 14:30
  fullDateTime, // Monday, March 25, 2024 14:30
  shortDateTime, // 03/25/24 14:30
  customFormat, // 25.03.2024 - 14:30
  dayMonth, // 25 Mar
  monthYear, // Mar 2024
  shortDayMonth, // Mon, 24 Jan
  longDayMonth, // Monday, 24 January
  yearMonthDay, // 2024-03-25
  europeanDate, // 25/03/2024
  fullMonthDate, // March 24
  timeWithSeconds, // 14:30:45
  twelveHourTime, // 02:30 PM
  compactDate, // 20240325
  weekdayShort, // Mon
  weekdayLong, // Monday
  isoFormat, // 2024-03-25T14:30:00.000Z
  timeToTwelveHour, // Converts 24-hour time to 12-hour time
  timeToTwentyFourHour, // Converts 12-hour time to 24-hour time
}

// Enum to track which text theme style to use
enum TextThemeStyle {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

enum DatePickerModeEnum {
  date,
  time,
  dateTime,
}
