class UnknownException implements Exception {
  final dynamic message;

  UnknownException([this.message]);

  @override
  String toString() => 'Tivemos um problema, tente novamente mais tarde.';
}
