import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileBusinessStatsWidget extends StatelessWidget {
  const ProfileBusinessStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
          if (state is ProfilePageSuccessState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        state.user.referralsSent.toString(),
                        style: const TextStyle(
                            color: CustomTheme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('Ref Sent'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        state.user.referralsReceived.toString(),
                        style: const TextStyle(
                            color: CustomTheme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('Ref Received'),
                      // TextCustom('Received', secondary: true)
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        state.user.referralsReceived.toString(),
                        style: const TextStyle(
                            color: CustomTheme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('Ref Completed'),
                      // TextCustom('Completed', secondary: true)
                    ],
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
}

// ignore: non_constant_identifier_names
Widget TextCustom(String data,
        {bool secondary = false,
        double fontSize = 14,
        final bool bold = false,
        final bool centreText = false}) =>
    Text(
      data,
      textAlign: centreText ? TextAlign.center : null,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : null,
          color: secondary
              ? CustomTheme.nightSecondaryFontColor
              : CustomTheme.nightFontColor),
    );
