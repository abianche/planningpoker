import 'dart:io';

import 'package:logger/logger.dart';

/// Get a logger for the given `className`.
Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className), filter: MyFilter());
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    var shouldLog = false;
    assert(() {
      if (event.level.index >= level.index) {
        shouldLog = true;
      }
      return true;
    }());
    return shouldLog;
  }
}

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter(this.className);

  static String getLevelString(Level level) {
    switch (level) {
      case Level.verbose:
        return 'VERBOSE';
      case Level.debug:
        return 'DEBUG';
      case Level.info:
        return 'INFO';
      case Level.warning:
        return 'WARNING';
      case Level.error:
        return 'ERROR';
      case Level.wtf:
        return 'WTF';
      case Level.nothing:
        return 'NOTHING';
      default:
        return 'UNKNOWN';
    }
  }

  String getTime() {
    String _threeDigits(int n) {
      if (n >= 100) return '$n';
      if (n >= 10) return '0$n';
      return '00$n';
    }

    String _twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final now = DateTime.now();
    final h = _twoDigits(now.hour);
    final min = _twoDigits(now.minute);
    final sec = _twoDigits(now.second);
    final ms = _threeDigits(now.millisecond);
    return '$h:$min:$sec.$ms';
  }

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final time = getTime();
    final level = getLevelString(event.level);

    // see: https://github.com/leisim/logger/issues/1
    if (Platform.isIOS) {
      return ['[$level] $time [$className] - ${event.message}'];
    }

    return [color('[$level] $time [$className] - ${event.message}')];
  }
}
