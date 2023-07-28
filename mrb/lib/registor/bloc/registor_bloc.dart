import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/registor/bloc/registor_event.dart';
import 'package:mrb/registor/bloc/registor_state.dart';

class RegistorBloc extends Bloc<RegistorEvent, RegistorState> {
  RegistorBloc() : super(RegistorInitialState()) {
    on<RegistorSignUpEvent>(_signUpUser);
  }

  Future<bool> _signUpUser(RegistorSignUpEvent event, emit) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
