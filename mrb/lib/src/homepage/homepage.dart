import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/view/chat_page_view.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/feed_page/view/feed_page_view.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/login/bloc/login_state.dart';
import 'package:mrb/src/network_page/bloc/network_page_bloc.dart';
import 'package:mrb/src/network_page/bloc/network_page_event.dart';
import 'package:mrb/src/network_page/view/network_page_view.dart';
import 'package:mrb/src/search_page/view/search_page_view.dart';
import 'package:mrb/src/user_timeline/view/user_timeline_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<NetworkPageBloc>(context)
                      .add(NetworkPageGetAssociatesEvent());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NetworkPage()));
                },
                text: 'Your Network'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<NetworkPageBloc>(context)
                      .add(NetworkPageGetAssociatesEvent());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                text: 'Search'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedPage()));
                },
                text: 'Feed'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserTimelinePage()));
                },
                text: 'Timeline'),
          ]);
    }));
  }
}
