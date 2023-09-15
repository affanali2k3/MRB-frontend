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
  const ReferralPostState(
      {this.isBuyer = true,
      this.houseType = HouseTypes.singleFamily,
      this.numOfBathrooms = 1,
      this.formType = FormType.open,
      this.numOfBedrooms = 1});
  final bool isBuyer;
  final String houseType;
  final int numOfBathrooms;
  final int numOfBedrooms;
  final FormType formType;
  @override
  List<Object?> get props => [isBuyer, houseType];
}

final class ReferralPostInitialState extends ReferralPostState {}

final class ReferralPostChangedState extends ReferralPostState {
  const ReferralPostChangedState({super.isBuyer, super.houseType});
}
