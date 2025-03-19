class OperationCallBack<T, V> {
  dynamic Function(dynamic data) success;
  dynamic Function(dynamic data) error;
  dynamic Function(dynamic data) authenticationError;
  dynamic Function(dynamic data) noInternet;

  OperationCallBack({
    required this.success,
    required this.error,
    required this.authenticationError,
    required this.noInternet,
  });
}
