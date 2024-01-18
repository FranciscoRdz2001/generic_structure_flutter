import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class HasConnection {
  HasConnection();

  Future<bool> call() async {
    if (kIsWeb) {
      return true;
    }
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
