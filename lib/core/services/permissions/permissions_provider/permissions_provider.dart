

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/permissions/permissions_model/permissions_model.dart';
import 'package:mirror/core/services/permissions/permissions_notifier/permissions_notifier.dart';

final permissionsProvider = StateNotifierProvider<PermissionsNotifier, PermissionsModel>((ref) {
  return PermissionsNotifier();
});