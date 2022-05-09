import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool exiting;
  final bool exited;

  HomeState({
    this.exiting = false,
    this.exited = false,
  });

  @override
  List<Object?> get props => [exiting, exited];
}
