import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mime/mime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_state.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';
import 'package:file_picker/file_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.repository})
      : super(const ProfileInitial(
            name: '',
            ssn: '',
            gender: '',
            occupation: '',
            phone: '',
            licence: '')) {
    on<ProfileSetEvent>(_setProfile);
    on<ProfileLogoutEvent>(_logoutUser);
    on<ProfileAddAvatarEvent>(_selectAvatar);
  }

  final ProfileRepository repository;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _logoutUser(ProfileLogoutEvent event, emit) async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  void _setProfile(ProfileSetEvent event, emit) async {
    try {
      emit(ProfileSetLoadingState(
          name: state.name,
          ssn: state.ssn,
          bytes: state.bytes,
          mimeType: state.mimeType,
          phone: state.phone,
          occupation: state.occupation,
          gender: state.gender,
          licence: state.licence));
      await repository.setProfile(
          name: event.name,
          ssn: event.ssn,
          licence: event.licence,
          licenceState: event.licenceState,
          licenceNumber: event.licenceNumber,
          yearLicenced: event.yearLicenced,
          address: event.address,
          completedDeals: event.numberOfCompletedDeals,
          previousDeals: event.previousDeals ?? [],
          phone: event.phone,
          mimeType: state.mimeType,
          buffer: state.bytes,
          occupation: event.occupation,
          gender: event.gender);
      emit(ProfileSetSuccessState(
          message: 'Profile set successfully',
          name: state.name,
          ssn: state.ssn,
          phone: state.phone,
          occupation: state.occupation,
          gender: state.gender,
          licence: state.licence));
    } catch (e) {
      print('check');
      emit(ProfileSetFailureState(
          message: 'Error setting profile $e',
          name: state.name,
          ssn: state.ssn,
          phone: state.phone,
          occupation: state.occupation,
          gender: state.gender,
          licence: state.licence));
    }
  }

  void _selectAvatar(ProfileAddAvatarEvent event, emit) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(withData: true);
    if (result != null) {
      PlatformFile file = result.files.first;
      final mimeType = lookupMimeType(file.path!);
      final buffer = file.bytes;
      print(buffer);
      emit(ProfileSetAvatarState(
          mimeType: mimeType!,
          bytes: buffer!,
          name: state.name,
          gender: state.gender,
          ssn: state.ssn,
          phone: state.phone,
          licence: state.licence,
          occupation: state.occupation));
    }
  }
}
