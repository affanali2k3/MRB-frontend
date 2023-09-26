import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_event_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';

class CustomAgentWidget extends StatelessWidget {
  const CustomAgentWidget({Key? key, required this.agent}) : super(key: key);

  final UserModel agent;

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
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff2E2E2E),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CustomProfilePhoto(
                  radius: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextCustom(agent.name),
                TextCustom(agent.email, secondary: true),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/icons/profile_page/mutual.png'),
                  const SizedBox(
                    width: 5,
                  ),
                  TextCustom('8 Mutuals', secondary: true)
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/icons/profile_page/add_friend.png'),
                  const Text(
                    'Add',
                    style: TextStyle(color: Color(0xff0A66C2)),
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
