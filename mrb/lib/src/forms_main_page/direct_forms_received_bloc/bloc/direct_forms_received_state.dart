import 'package:equatable/equatable.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/model/direct_forms_model.dart';

abstract class DirectFormsReceivedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DirectFormsReceivedInitialState extends DirectFormsReceivedState {}

final class DirectFormsReceivedLoadingState extends DirectFormsReceivedState {}

final class DirectFormsReceivedSuccessState extends DirectFormsReceivedState {
  DirectFormsReceivedSuccessState({required this.directForms});
  final List<DirectFormModel> directForms;
}

final class DirectFormsReceivedFailedState extends DirectFormsReceivedState {
  DirectFormsReceivedFailedState({required this.error});
  final String error;
}
