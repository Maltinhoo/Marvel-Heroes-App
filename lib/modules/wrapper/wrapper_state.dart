import 'package:equatable/equatable.dart';

class WrapperState extends Equatable {
  final bool isLoading;
  final bool isLogged;

  WrapperState({
    this.isLoading = true,
    this.isLogged = false,
  });

  @override
  List<Object?> get props => [isLoading, isLogged];
}
