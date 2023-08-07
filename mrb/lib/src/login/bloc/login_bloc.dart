import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/bloc/login_state.dart';
import 'package:mrb/src/login/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository}) : super(LoginLoggedOutState()) {
    on<LoginLoginEvent>(_login);
    on<LoginLogoutEvent>(_logout);
    on<ChangeLoginEvent>(_changeLoginState);
    on<ChangeLogoutEvent>(_changeLogoutState);
    on<LoginGoogleLoginEvent>(_googleLogin);
  }
  final auth = FirebaseAuth.instance;
  final LoginRepository repository;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _changeLoginState(ChangeLoginEvent event, emit) {
    emit(LoginSuccessState());
  }

  void _changeLogoutState(ChangeLogoutEvent event, emit) {
    emit(LoginLoggedOutState());
  }

  void _login(LoginLoginEvent event, emit) async {
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (userCredentials.user!.emailVerified == false) {
        // emit(LoginInvalidEmailState(
        //     error: 'Please verify the email before logging in'));
        // auth.signOut();
        return;
      }
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

  void _googleLogin(LoginGoogleLoginEvent event, emit) async {
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

  void _logout(LoginLogoutEvent event, emit) async {
    try {
      await auth.signOut();
      emit(LoginLoggedOutState());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
