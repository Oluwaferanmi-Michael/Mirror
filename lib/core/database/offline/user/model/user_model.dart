import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class User {
  final Id id = Isar.autoIncrement;
  String? name;

  @override
  String toString() => 'name: $name';
}
