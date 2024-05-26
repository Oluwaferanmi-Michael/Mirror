import 'package:mirror/core/AI/helpers/notifier_state.dart';
import 'package:mirror/core/AI/models/model/message_class.dart';

extension ImageAssetExt on String {
  String imgAsset() => 'assets/img/$this';
}

extension LottieAsset on String {
  String lottieAsset() => 'assets/lottie/$this';
}

extension EnumConvert on AiNotifierState {
  MessageType messageType() {
    switch (this) {
      case AiNotifierState.regularResponse:
        return MessageType.aiResponse;
      case AiNotifierState.weatherForecast:
        return MessageType.weatherForecast;
    }
  }
}
