import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_state.dart';

class FeedPageBloc extends Bloc<FeedPageEvent, FeedPageState> {
  FeedPageBloc() : super(FeedPageInitialState()) {}
}
