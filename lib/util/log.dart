import 'package:logger/logger.dart';

class Log {
  static Log? _instance;
  static Logger? _logger;

  Log._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
          stackTraceBeginIndex: 5,
          methodCount: 2, // number of method calls to be displayed
          errorMethodCount:
              8, // number of method calls if stacktrace is provided
          lineLength: 120, // width of the output
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
    _instance = this;
  }
  factory Log() => _instance ?? Log._internal();

  static d(String msg) {
    _logger?.d(msg);
    //print('d: $msg');
  }

  static e(String msg) {
    _logger?.e(msg);
    //print('e: $msg');
  }

  static i(String msg) {
    _logger?.i(msg);
    //print('i: $msg');
  }
}

class Logging {
  Logger? _logger;

  Logging() {
    _logger = Logger();
  }

  d(String msg) {
    _logger?.d(msg);
    //print('d: $msg');
  }

  e(String msg) {
    _logger?.e(msg);
    //print('e: $msg');
  }

  i(String msg) {
    _logger?.i(msg);
    //print('i: $msg');
  }
}
