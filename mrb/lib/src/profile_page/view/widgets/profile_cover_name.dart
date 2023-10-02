import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileCoverNameWidget extends StatelessWidget {
  const ProfileCoverNameWidget({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        return Container(
          height: 200,
          width: double.infinity,
          color: CustomTheme.nightSecondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  (state as ProfilePageSuccessState).photo == null
                      ? const CircleAvatar(
                          radius: 48,
                          backgroundImage:
                              AssetImage('assets/default_profile_photo.jpeg'))
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
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileEditPage(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.edit,
                          size: 12,
                          color: CustomTheme.primaryColor,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextCustom((state as ProfilePageSuccessState).name),
              TextCustom((state as ProfilePageSuccessState).email,
                  secondary: true)
            ],
          ),
        );
      });
}
