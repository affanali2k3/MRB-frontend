import 'package:mime/mime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_state.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';
import 'package:file_picker/file_picker.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc({required this.repository})
      : super(ProfileEditInitialState()) {
    on<ProfileEditSetEvent>(_setProfile);
    on<ProfileEditAddAvatarEvent>(_selectAvatar);
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
          coverMimeType: event.coverPhotoMimeType!,
          avatarMimeType: event.avatarMimeType!);

      emit(ProfileEditSetSuccessState());
    } catch (e) {
      print(e);
      emit(ProfileEditSetFailureState(error: e.toString()));
    }
  }

  void _selectAvatar(ProfileEditAddAvatarEvent event, emit) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(withData: true);
    if (result != null) {
      PlatformFile file = result.files.first;
      final mimeType = lookupMimeType(file.path!);
      final buffer = file.bytes;

      print(buffer);
      // emit(ProfileEditChangedState(
      //     avatarMimeType: mimeType!,
      //     avatarbytes: buffer!,
      //     coverPhotoBytes: changedState.coverPhotoBytes,
      //     coverPhotoMimeType: changedState.coverPhotoMimeType));
    }
  }

  void _selectCoverPhoto(ProfileEditAddAvatarEvent event, emit) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(withData: true);
    if (result != null) {
      PlatformFile file = result.files.first;
      final mimeType = lookupMimeType(file.path!);
      final buffer = file.bytes;

      // final ProfileEditChangedState changedState =
      //     state as ProfileEditChangedState;

      // print(buffer);
      // emit(ProfileEditChangedState(
      //     avatarMimeType: mimeType!,
      //     avatarbytes: buffer!,
      //     coverPhotoBytes: changedState.coverPhotoBytes,
      //     coverPhotoMimeType: changedState.coverPhotoMimeType));
    }
  }
}
