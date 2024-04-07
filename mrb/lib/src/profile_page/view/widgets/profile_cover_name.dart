import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_connect_message.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileCoverNameWidget extends StatelessWidget {
  const ProfileCoverNameWidget({super.key, required this.userId});

  final int userId;

  num calculateAnalyticScore(num score, int number) {
    if (number == 0) {
      return 0;
    } else {
      return score / number;
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        if (state is ProfilePageSuccessState) {
          return Container(
            height: 250,
            width: double.infinity,
            color: CustomTheme.nightSecondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        '${GlobalVariables.url}/user/avatar?userId=${state.user.id}&avatarName=avatar',
                        fit: BoxFit.fill, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return SizedBox(
                          height: 100,
                          width: 100,
                          child:
                              Image.asset('assets/default_profile_photo.jpeg'));
                    }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.user.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextCustom(state.email, secondary: true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.user.email,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        // size: 10,
                      ),
                      itemCount: 1,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    Text(
                        '${calculateAnalyticScore(state.analytics.agentToAgentRatingScore, state.analytics.agentToAgentRatingNumber)} (${state.analytics.agentToAgentRatingNumber} reviews)')
                  ],
                ),

                Container(
                    child: userId == GlobalVariables.user.id
                        ? null
                        : ProfileConnectMessageWidget(
                            userId: userId,
                          )),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      });
}
