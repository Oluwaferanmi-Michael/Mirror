extension ImageAssetExt on String {
  String imgAsset() => 'assets/img/$this';
}

extension LottieAsset on String {
  String lottieAsset() => 'assets/lottie/$this';
}
