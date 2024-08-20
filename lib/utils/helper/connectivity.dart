import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  final StreamController<bool> _controller =
      StreamController<bool>.broadcast();

  Stream<bool> get networkStream => _controller.stream;

  Future<void> initialise() async {
    final List<ConnectivityResult> result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      _checkStatus(result);
    });
  }

  Future<void> _checkStatus(List<ConnectivityResult> result) async {
    try {
      final List<InternetAddress> rs =
          await InternetAddress.lookup('google.com');
      if (rs.isNotEmpty && rs[0].rawAddress.isNotEmpty) {
        _controller.sink.add(true);
      } else {
        _controller.sink.add(false);
      }
    } on SocketException catch (_) {
      _controller.sink.add(false);
    }
  }

  void disposeStream() => _controller.close();
}
