import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_event_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomAgentWidget extends StatelessWidget {
  const CustomAgentWidget({Key? key, required this.agent}) : super(key: key);

  final UserModel agent;

  num calculateAnalyticScore(num score, int number) {
    if (number == 0) {
      return 0;
    } else {
      return score / number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProfilePageBloc>().add(ProfilePageLoadingEvent(
            userId: agent.id, associateId: GlobalVariables.user.id));

        context
            .read<ProfilePostPageBloc>()
            .add(ProfilePostPageLoadingEvent(userId: agent.id));

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(userId: agent.id),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(30, 0, 0, 0))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CustomProfilePhoto(
                  radius: 60,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  agent.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                      '${calculateAnalyticScore(agent.agentToAgentRatingScore, agent.agentToAgentRatingNumber)} (${agent.agentToAgentRatingNumber} reviews)',
                      style: const TextStyle(
                          color: CustomTheme.secondaryFontColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '8+ Mutual Friends',
                        style: TextStyle(color: CustomTheme.tertiaryFontColor),
                      )
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 5),
                      decoration: BoxDecoration(
                          color: CustomTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Follow',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
