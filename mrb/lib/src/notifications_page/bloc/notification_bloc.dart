import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/notifications_page/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState());
}
