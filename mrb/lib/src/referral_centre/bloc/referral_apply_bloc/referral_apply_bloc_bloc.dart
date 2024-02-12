import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/referral_centre/repository/referral_centre_repository.dart';

part 'referral_apply_bloc_event.dart';
part 'referral_apply_bloc_state.dart';

class ReferralApplyBloc extends Bloc<ReferralApplyEvent, ReferralApplyState> {
  ReferralApplyBloc({required this.repository})
      : super(ReferralApplyInitialState()) {
    on<ReferralApplyLeadEvent>(_applyForLead);
  }

  final ReferralCentreRepository repository;

  void _applyForLead(ReferralApplyLeadEvent event, emit) async {
    try {
      emit(ReferralApplyLoadingState());
      final Response response = await repository.applyForLead(
          senderAgentFormId: event.senderAgentFormId,
          receiverAgentId: event.receiverAgent,
          proposal: event.proposal);

      if (response.statusCode == 500) {
        throw Exception("Auth token not provided");
      }
      print(response.body);
      emit(ReferralApplySuccessState());
    } catch (e) {
      emit(ReferralApplyFailedState(error: e.toString()));
    }
  }
}
