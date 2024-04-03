import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:mrb/src/profile_completion_page/repository/profile_completion_repository.dart';

part 'profile_completion_event.dart';
part 'profile_completion_state.dart';

class ProfileCompletionBloc
    extends Bloc<ProfileCompletionEvent, ProfileCompletionState> {
  ProfileCompletionBloc({required this.repository})
      : super(ProfileCompletionInitialState()) {
    on<ProfileCompletionSubmitEvent>(_submitProfile);
    on<ProfileCompletionErrorEvent>(_generateErrorState);
  }

  final ProfileCompletionRepository repository;

  void _submitProfile(ProfileCompletionSubmitEvent event, emit) async {
    try {
      print('blocc');
      emit(ProfileCompletionLoadingState());
      final Response response = await repository.submit(event: event);
      print(response.body);
      emit(ProfileCompletionSuccessState());
    } catch (e) {
      emit(ProfileCompletionFailedState(
          type: ProfileCompletionPageErrorTypes.backend, error: e.toString()));
    }
  }

  void _generateErrorState(ProfileCompletionErrorEvent event, emit) async {
    emit(ProfileCompletionFailedState(type: event.type, error: event.message));
  }
}
