import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_state.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.senderEmail, required this.receiverEmail})
      : super(key: key);
  final String senderEmail;
  final String receiverEmail;
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
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
        body: SafeArea(child:
            BlocBuilder<ChatPageBloc, ChatPageState>(builder: (context, state) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration:
                    const BoxDecoration(color: CustomTheme.nightAppbarColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                    Row(
                      children: [
                        const CustomProfilePhoto(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            TextCustom('Ahmed Ali'),
                            TextCustom('London, UK', secondary: true)
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          );
        })));
  }
}
