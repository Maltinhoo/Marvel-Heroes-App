class NoInternetConnectionException implements Exception {
  final dynamic message;

  NoInternetConnectionException([this.message]);

  @override
  String toString() => 'Sem conexão de internet';
}
