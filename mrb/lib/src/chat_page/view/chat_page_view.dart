import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_state.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.senderId, required this.receiverId})
      : super(key: key);
  final int senderId;
  final int receiverId;
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        bottomNavigationBar:
            BlocBuilder<ChatPageBloc, ChatPageState>(builder: (context, state) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: BottomAppBar(
                  color: CustomTheme.nightSecondaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          style: const TextStyle(
                              color: CustomTheme.nightSecondaryFontColor),
                          controller: _messageController,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (state.messages.isEmpty) {
                            context.read<ChatPanelBloc>().add(
                                ChatPanelCreateChatEvent(
                                    receiverId: receiverId,
                                    senderId: senderId,
                                    message: _messageController.text));
                          }
                          context.read<ChatPageBloc>().add(
                              ChatPageSendMessageEvent(
                                  senderId: senderId,
                                  receiverId: receiverId,
                                  message: _messageController.text));
                        },
                        child: const Text('Send'),
                      ),
                    ],
                  )));
        }),
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
              ),
              ListView.builder(
                itemCount: state.messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.minPositive,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xff9BA9B0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      state.messages[index].message,
                    ),
                  );
                },
              )
            ],
          );
        })));
  }
}
