import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState()) {
    on<ChangePageEvent>(_changePage);
  }

  void _changePage(ChangePageEvent event, emit) {
    if (event.page == 'referralCentrePage') {
      emit(ReferralCenterPageState());
    } else if (event.page == 'networkPage') {
      emit(NetworkPageState());
    } else if (event.page == 'feedPage') {
      emit(FeedPageState());
    } else if (event.page == 'notificationPage') {
      emit(NotificationPageState());
    } else if (event.page == 'profilePage') {
      emit(ProfilePageState());
    }
  }
}
