import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/login/cubit/login_event.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/login/repository/login_repository.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

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

  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
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
      debugPrint(e.code);
    }
  }

  Future<bool> getUserData({required String email}) async {
    try {
      print('Getting user data');
      final Response response = await repository.getUser(email: email);
      print('Got user data');
      final UserModel user =
          UserModel.fromJson(json.decode(response.body)['data']);
      print(user);
      GlobalVariables.user = user;
      print(GlobalVariables.user);
      return true;
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
      debugPrint(e.code);
      return false;
    }
  }

  Future<void> googleLogin() async {
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
  }

  void logout(LoginLogoutEvent event, emit) async {
    try {
      await auth.signOut();
      emit(LoginLoggedOutState());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
