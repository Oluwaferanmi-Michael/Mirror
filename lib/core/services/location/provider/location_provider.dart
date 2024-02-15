import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/location/models/user_location_model.dart';
import 'package:mirror/core/services/location/notifier/location_notifier.dart';

final locationProvider = StateNotifierProvider<LocationStateNotifier, UserLocation>((ref) => LocationStateNotifier());
