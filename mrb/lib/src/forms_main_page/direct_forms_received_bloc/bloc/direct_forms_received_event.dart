import 'package:equatable/equatable.dart';

abstract class DirectFormsReceivedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DirectFormsReceivedLoadingEvent extends DirectFormsReceivedEvent {}
