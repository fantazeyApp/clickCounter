import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2717584945928240/2330850602";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2717584945928240/2330850602";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
