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

  Future<bool> _signUpUser(RegistorSignUpEvent event, emit) async {
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
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      switch (e.code) {
        case 'email-already-in-use':
          emit(RegistorWrongEmailState(
              error: 'Account for this email already exists'));
          break;
        case 'invalid-email':
          emit(RegistorWrongEmailState(error: 'Invalid email format'));
          break;
        case 'weak-password':
          emit(RegistorWrongPasswordState(error: 'Weak Password'));
          break;
      }
      return false;
    }
  }
}
