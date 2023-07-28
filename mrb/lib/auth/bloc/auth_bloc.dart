import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/auth/bloc/auth_event.dart';
import 'package:mrb/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }
  final auth = FirebaseAuth.instance;

  void _login(AuthLoginEvent event, emit) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  void _logout(AuthLogoutEvent event, emit) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
