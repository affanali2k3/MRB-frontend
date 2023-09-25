import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

abstract class ReferralPostEvent {}

final class ReferralPostChangeIsBuyerEvent extends ReferralPostEvent {
  ReferralPostChangeIsBuyerEvent({required this.isBuyer});
  final bool isBuyer;
}

final class ReferralPostChangeHouseTypeEvent extends ReferralPostEvent {
  ReferralPostChangeHouseTypeEvent({required this.houseType});
  final String houseType;
}

final class ReferralPostChangeStateEvent extends ReferralPostEvent {
  ReferralPostChangeStateEvent({required this.state});
  final String state;
}

final class ReferralPostChangeCityEvent extends ReferralPostEvent {
  ReferralPostChangeCityEvent({required this.city});
  final String city;
}

final class ReferralPostChangeFormTypeEvent extends ReferralPostEvent {
  ReferralPostChangeFormTypeEvent({required this.formType});
  final FormType formType;
}

final class ReferralPostOpenFormPostEvent extends ReferralPostEvent {
  ReferralPostOpenFormPostEvent({
    required this.price,
    required this.timeAmount,
    required this.city,
    required this.state,
    required this.isBuyer,
    required this.houseType,
    required this.formType,
  });
  final double price;
  final int timeAmount;
  final String city;
  final String state;
  final bool isBuyer;
  final String houseType;
  final FormType formType;
}
