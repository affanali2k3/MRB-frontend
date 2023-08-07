import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState()) {
    on<ChangePageEvent>(_changePage);
  }

  void _changePage(ChangePageEvent event, emit) {
    if (event.page == 0) {
      emit(LoginPageState());
    } else if (event.page == 1) {
      emit(RegistorPageState());
    } else if (event.page == 2) {
      emit(ProfileEditPageState());
    } else if (event.page == 3) {
      emit(ProfilePageState());
    }
  }
}
