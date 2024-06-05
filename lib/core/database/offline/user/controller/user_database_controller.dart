import 'package:isar/isar.dart';
import 'package:mirror/core/database/offline/user/model/user_model.dart';
import 'package:path_provider/path_provider.dart';

class UserDatabase {
  Future<Isar> getDetails() async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open([UserSchema], directory: dir.path);

    return isar;
  }
}
