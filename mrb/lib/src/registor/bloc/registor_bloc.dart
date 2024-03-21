import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/registor/bloc/registor_event.dart';
import 'package:mrb/src/registor/bloc/registor_state.dart';
import 'package:mrb/src/registor/repository/registor_repository.dart';

class RegistorBloc extends Bloc<RegistorEvent, RegistorState> {
  RegistorBloc({required this.repository}) : super(RegistorInitialState()) {
    on<RegistorSignUpEvent>(_signUpUser);
  }

  RegistorRepository repository;

  void _signUpUser(RegistorSignUpEvent event, emit) async {
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      if (userCredentials.user != null) {
        print('Email verification: ${userCredentials.user!.emailVerified}');
        await userCredentials.user!.sendEmailVerification();
      }
      repository.setProfile(email: event.email);
      emit(RegistorSuccessState());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      switch (e.code) {
        case 'email-already-in-use':
          emit(RegistorFailedState(
              error: 'Account for this email already exists',
              type: "ACCOUNT_EXISTS"));
          break;
        case 'invalid-email':
          emit(RegistorFailedState(
              error: 'Invalid email format', type: "INVALID_EMAIL"));
          break;
        case 'weak-password':
          emit(RegistorFailedState(
              error: 'Weak Password', type: "WEAK_PASSWORD"));
          break;
        default:
          emit(RegistorFailedState(error: "Error occured", type: e.code));
      }
    }
  }
}
