import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_connect_message.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileCoverNameWidget extends StatelessWidget {
  const ProfileCoverNameWidget({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        return Container(
          height: 250,
          width: double.infinity,
          color: CustomTheme.nightSecondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  (state as ProfilePageSuccessState).photo == null
                      ? Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6, color: CustomTheme.primaryColor),
                              borderRadius: BorderRadius.circular(150)),
                          child: const CircleAvatar(
                              radius: 48,
                              backgroundImage: AssetImage(
                                  'assets/default_profile_photo.jpeg')),
                        )
                      : Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(68)),
                          child: Image.network(
                            '${GlobalVariables.url}/user/avatar?userId=$userId&avatarName=${state.photo}',
                            fit: BoxFit.fill,
                          ),
                        ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.name,
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
                    state.email,
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
                  const Text('4.7 (6.8K review)')
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
      });
}
