import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_state.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc({required this.repository})
      : super(ProfileEditInitialState()) {
    on<ProfileEditSetEvent>(_setProfile);
  }

  final ProfileRepository repository;

  void _setProfile(ProfileEditSetEvent event, emit) async {
    try {
      emit(ProfileEditSetLoadingState());

      await repository.setProfile(
          userId: GlobalVariables.user.id,
          biography: event.biography,
          avatarBytes: event.avatarbytes,
          coverBytes: event.coverPhotoBytes,
          coverMimeType: event.coverPhotoMimeType,
          avatarMimeType: event.avatarMimeType);

      emit(ProfileEditSetSuccessState());
    } catch (e) {
      print(e);
      emit(ProfileEditSetFailureState(error: e.toString()));
    }
  }
}
