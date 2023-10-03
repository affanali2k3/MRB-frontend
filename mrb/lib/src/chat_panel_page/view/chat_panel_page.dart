import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/view/chat_page_view.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_state.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/common/top_bar_secondary_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ChatPanelPage extends StatelessWidget {
  ChatPanelPage({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBarSecondaryWidget(
        title: 'Messages',
      ),
      backgroundColor: CustomTheme.nightBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: CustomTheme.nightTertiaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextCustom('Messages')),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ChatPanelBloc, ChatPanelState>(
                  builder: (context, state) {
                if (state is ChatPanelLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ChatPanelSuccessState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.chats.length,
                    primary: false,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<ChatPageBloc>().add(
                            ChatPageLoadMessagesEvent(
                                userOneId: GlobalVariables.user.id,
                                userTwoId: state.chats[index].userTwoId));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                  senderId: GlobalVariables.user.id,
                                  receiverId: state.chats[index].userTwoId),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomTheme.nightTertiaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              const CustomProfilePhoto(),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(state.chats[index].userName),
                                  TextCustom(state.chats[index].lastMessage,
                                      secondary: true)
                                ],
                              ),
                            ]),
                            Column(
                              children: [
                                TextCustom('10:07 AM', secondary: true),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
