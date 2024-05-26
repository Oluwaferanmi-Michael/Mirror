import 'dart:developer' as dev show log;

extension Logger on Object {
  void log([String? prefix]) => dev.log('----$prefix: ${toString()}');
}