import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_state.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.senderEmail, required this.receiverEmail})
      : super(key: key);
  final String senderEmail;
  final String receiverEmail;
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Socket.IO Client'),
        ),
        bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: _messageController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.read<ChatPageBloc>().add(
                      ChatPageSendMessageEvent(
                          senderEmail: senderEmail,
                          receiverEmail: receiverEmail,
                          message: _messageController.text)),
                  child: const Text('Send'),
                ),
              ],
            ))),
        body:
            BlocBuilder<ChatPageBloc, ChatPageState>(builder: (context, state) {
          if (state is ChatPageMessagesLoadedState) {
            print(state.messages.length);
            return Container(
                child: ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) => Container(
                  alignment: state.messages[index].senderEmail ==
                          FirebaseAuth.instance.currentUser!.email!
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  width: double.infinity,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      color: state.messages[index].senderEmail ==
                              FirebaseAuth.instance.currentUser!.email!
                          ? Colors.grey
                          : Colors.amber,
                      child: Text(state.messages[index].message))),
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
