import 'package:equatable/equatable.dart';

abstract class AgentOpenFormsSentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AgentOpenFormsSentLoadingEvent extends AgentOpenFormsSentEvent {
  AgentOpenFormsSentLoadingEvent({required this.userId});
  final int userId;
}
