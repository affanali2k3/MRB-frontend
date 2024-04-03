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
      emit(ProfileEditLoadingState());

      print(event.licenseState);

      if (event.name.length < 2) {
        emit(ProfileEditFailedState(
            error: 'Name should be longer than 2 characters'));
        return;
      }

      if (event.licenseState == null ||
          event.licenseState == "Primary License State") {
        emit(ProfileEditFailedState(error: 'Please select a license state'));
        return;
      }
      if (event.licenseNumber == "") {
        emit(ProfileEditFailedState(error: 'Please enter license Number'));
        return;
      }
      if (event.licenseYear == null) {
        emit(ProfileEditFailedState(error: 'Please select license year'));
        return;
      }

      await repository.setProfile(
          userId: GlobalVariables.user.id,
          biography: event.biography,
          avatarBytes: event.avatarbytes,
          name: event.name,
          phone: event.phone,
          address: event.address,
          licenseNumber: event.licenseNumber,
          licenseState: event.licenseState!,
          licenseYear: event.licenseYear!,
          avatarMimeType: event.avatarMimeType);

      emit(ProfileEditSuccessState());
    } catch (e) {
      print(e);
      emit(ProfileEditFailedState(error: e.toString()));
    }
  }
}
