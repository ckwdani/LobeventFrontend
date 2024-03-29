import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final bool connectionChecker = true;

  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async => connectionChecker;
}
