import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/view/chat_page_view.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileConnectMessageWidget extends StatelessWidget {
  const ProfileConnectMessageWidget({Key? key, required this.userId})
      : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  if (state.associationStatus == null) {
                    context.read<ProfilePageBloc>().add(
                        ProfilePageSendAssociateRequestEvent(
                            senderId: GlobalVariables.user.id,
                            receiverId: userId));
                    return;
                  }

                  if (state.associationStatus!.senderId ==
                          GlobalVariables.user.id &&
                      state.associationStatus!.status == 'Pending') {
                    return;
                  } else if (state.associationStatus!.receiverId ==
                          GlobalVariables.user.id &&
                      state.associationStatus!.status == 'Pending') {
                    context.read<ProfilePageBloc>().add(
                        ProfilePageAcceptAssociateRequestEvent(
                            senderId: state.associationStatus!.senderId,
                            receiverId: GlobalVariables.user.id));
                    return;
                  }
                  return;
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                        border: (state as ProfilePageSuccessState)
                                    .associationStatus ==
                                null
                            ? null
                            : Border.all(color: CustomTheme.primaryColor),
                        color: (state as ProfilePageSuccessState)
                                    .associationStatus ==
                                null
                            ? CustomTheme.primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(20)),
                    child: associationStatusButton(
                        context, state.associationStatus))),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                context.read<ChatPageBloc>().add(ChatPageLoadMessagesEvent(
                    userOneId: GlobalVariables.user.id, userTwoId: userId));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        senderId: GlobalVariables.user.id,
                        receiverId: userId,
                      ),
                    ));
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: CustomTheme.primaryColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/profile_page/message.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Message',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.primaryColor),
                      ),
                    ],
                  )),
            ),
          ],
        );
      });
}

Widget associationStatusButton(
    BuildContext context, final UserAssociationModel? associationStatus) {
  if (associationStatus == null) {
    return const Text(
      'Connect',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  if (associationStatus.senderId == GlobalVariables.user.id &&
      associationStatus.status == 'Pending') {
    return const Text(
      'Pending',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  } else if (associationStatus.receiverId == GlobalVariables.user.id &&
      associationStatus.status == 'Pending') {
    return const Text(
      'Accept',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
  return const Text(
    'Friends',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
