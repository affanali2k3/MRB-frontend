import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState()) {
    on<ChangePageEvent>(_changePage);
  }

  void _changePage(ChangePageEvent event, emit) {
    if (event.page == 1) {
      emit(ReferralCenterPageState());
    } else if (event.page == 2) {
      emit(NetworkPageState());
    } else if (event.page == 3) {
      emit(FeedPageState());
    } else if (event.page == 4) {
      emit(NotificationPageState());
    } else if (event.page == 5) {
      emit(ProfilePageState());
    }
  }
}
