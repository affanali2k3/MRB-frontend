import 'package:equatable/equatable.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class HouseTypes {
  static const singleFamily = 'Single Family';
  static const townHome = 'Town Home';
  static const rowHome = 'Row Home';
  static const condo = 'Condo';
  static const duplex = 'Duplex';
}

abstract class ReferralPostState extends Equatable {
  const ReferralPostState({
    this.isBuyer = true,
    this.state = 'Alabama',
    this.city = 'Birmingham',
    this.houseType = HouseTypes.singleFamily,
    this.formType = FormType.open,
  });
  final bool isBuyer;
  final String state;
  final String city;
  final String houseType;
  final FormType formType;
  @override
  List<Object?> get props => [isBuyer, houseType, state, city, formType];
}

final class ReferralPostInitialState extends ReferralPostState {}

final class ReferralPostChangedState extends ReferralPostState {
  const ReferralPostChangedState(
      {super.isBuyer,
      super.houseType,
      super.state,
      super.city,
      super.formType});
}

final class ReferralPostingState extends ReferralPostState {}

final class ReferralPostSuccessState extends ReferralPostState {}

final class ReferralPostFailedState extends ReferralPostState {
  const ReferralPostFailedState({required this.error});
  final String error;
}
