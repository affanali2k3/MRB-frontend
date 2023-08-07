import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/view/chat_page_view.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/network_page/bloc/network_page_bloc.dart';
import 'package:mrb/src/network_page/bloc/network_page_event.dart';
import 'package:mrb/src/network_page/bloc/network_page_state.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<NetworkPageBloc, NetworkPageState>(
      builder: (context, state) {
        if (state is NetworkPageInitialState) {
          context.read<NetworkPageBloc>().add(NetworkPageGetAssociatesEvent());
        } else if (state is NetworkPageSuccessState) {
          return ListView.builder(
            itemCount: state.associates.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.all(20),
                  height: 120,
                  child: Column(children: [
                    Text(state.associates[index].email),
                    CustomOutlineButton(
                        onPressed: () {
                          BlocProvider.of<ChatPageBloc>(context).add(
                              ChatPageLoadMessagesEvent(
                                  userOneEmail:
                                      FirebaseAuth.instance.currentUser!.email!,
                                  userTwoEmail: state.associates[index].email));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  senderEmail:
                                      FirebaseAuth.instance.currentUser!.email!,
                                  receiverEmail: state.associates[index].email,
                                ),
                              ));
                        },
                        text: 'Chat')
                  ]));
            },
          );
        }
        return Container();
      },
    ));
  }
}
