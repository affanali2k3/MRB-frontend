import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginLoginEvent>(_login);
    on<LoginLogoutEvent>(_logout);
  }
  final auth = FirebaseAuth.instance;

  void _login(LoginLoginEvent event, emit) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
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

  void _logout(LoginLogoutEvent event, emit) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
