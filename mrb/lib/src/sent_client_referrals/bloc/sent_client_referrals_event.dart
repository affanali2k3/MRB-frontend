import 'package:equatable/equatable.dart';

abstract class SentClientReferralsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SentClientReferralsDirectLoadingEvent
    extends SentClientReferralsEvent {}

final class SentClientReferralsOpenLoadingEvent
    extends SentClientReferralsEvent {}
