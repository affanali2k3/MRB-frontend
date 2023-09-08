import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/view/chat_page_view.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_state.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ChatPanelPage extends StatelessWidget {
  ChatPanelPage({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.nightAppbarColor,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        title: const Text(
          'Messages',
        ),
        centerTitle: true,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                  senderEmail: 'senderEmail',
                                  receiverEmail: 'receiverEmailr'),
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
