import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;
  AppLogger._internal();

  final Logger _logger = Logger();

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error: error, stackTrace: stackTrace);
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error: error, stackTrace: stackTrace);
  }
}

extension LoggerExtension on Object {
  void logV([String? message]) {
    AppLogger().v('${message ?? ''} $this');
  }

  void logD([String? message]) {
    AppLogger().d('${message ?? ''} $this');
  }

  void logI([String? message]) {
    AppLogger().i('${message ?? ''} $this');
  }

  void logW([String? message]) {
    AppLogger().w('${message ?? ''} $this');
  }

  void logE([String? message, dynamic error, StackTrace? stackTrace]) {
    AppLogger().e('${message ?? ''} $this', error, stackTrace);
  }

  void logWTF([String? message]) {
    AppLogger().wtf('${message ?? ''} $this');
  }
}
