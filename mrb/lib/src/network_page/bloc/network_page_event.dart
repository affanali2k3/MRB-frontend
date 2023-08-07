import 'package:equatable/equatable.dart';

abstract class NetworkPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkPageGetAssociatesEvent extends NetworkPageEvent {}
