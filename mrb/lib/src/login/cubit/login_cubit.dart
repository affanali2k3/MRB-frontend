import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/login/repository/login_repository.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/referral_centre/model/user_preference_model.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginLoggedOutState());

  final auth = FirebaseAuth.instance;
  final LoginRepository repository;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void changeLoginState({emit = Emitter}) {
    emit(LoginSuccessState());
  }

  void changeLogoutState({emit = Emitter}) {
    emit(LoginLoggedOutState());
  }

  void login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      switch (e.code) {
        case 'invalid-email':
          emit(LoginInvalidEmailState(error: 'Invalid format for email'));
          break;
        case 'wrong-password':
          emit(LoginInvalidPasswordState(error: 'Invalid password'));
          break;
        case 'user-not-found':
          emit(LoginInvalidEmailState(error: 'User not found'));
      }
      emit(LoginFailedState());
    }
  }

  void getUserData({required String email}) async {
    try {
      final Response response = await repository.getUser(email: email);

      if (response.statusCode == 500) {
        emit(LoginUserNotExistState());
        return;
      }

      print('User ${response.body}');
      GlobalVariables.user =
          UserModel.fromJson(json.decode(response.body)['data']);

      print('User data ${GlobalVariables.user}');
      final Response preferenceResponse =
          await repository.getUserPreferences(userId: GlobalVariables.user.id);

      print('Pref Response ${preferenceResponse.body}');
      GlobalVariables.socket = IO.io(GlobalVariables.url);

      GlobalVariables.socket.onConnect((_) {
        print('connected');
      });

      GlobalVariables.preferences = UserPreferenceModel.fromJson(
          json.decode(preferenceResponse.body)['data']);
      print('Pref Response data ${GlobalVariables.preferences}');

      emit(LoginSuccessfullyGotDataState());
    } catch (e) {
      print('Backend error ${e.toString()}');
      emit(LoginFailedGettingDataState(error: e.toString()));
    }
  }

  void googleLogin() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return;

      final GoogleSignInAuthentication googleAuth = await user.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final userCredentials = await auth.signInWithCredential(credentials);

      if (userCredentials.additionalUserInfo!.isNewUser) {
        try {
          repository.setProfile(email: user.email);
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
