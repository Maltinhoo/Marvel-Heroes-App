import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isLogged;
  final String? message;

  LoginState({
    this.isLoading = false,
    this.isLogged = false,
    this.message,
  });

  @override
  List<Object?> get props => [isLoading, isLogged, message];
}
