import 'dart:developer' as dev show log;

extension Logger on Object {
  void log() => dev.log(toString());
}
