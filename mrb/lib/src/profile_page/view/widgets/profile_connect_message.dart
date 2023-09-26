import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
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
                  context.read<ProfilePageBloc>().add(
                      ProfilePageSendAssociateRequestEvent(
                          senderId: GlobalVariables.user.id,
                          receiverId: userId));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
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
                        borderRadius: BorderRadius.circular(5)),
                    child: state.associationStatus == null
                        ? TextCustom('Connect')
                        : TextCustom(state.associationStatus!.status))),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      color: CustomTheme.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextCustom('Message')),
            ),
          ],
        );
      });
}
