import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';

class ProfileNetworkPage extends StatelessWidget {
  const ProfileNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
      if (state is ProfilePageNetworkTabState) {
        return SingleChildScrollView(
          child: ListView.builder(
            itemCount: state.userNetwork.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
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
                        size: 80,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextCustom(state.userNetwork[index].name),
                      TextCustom(state.userNetwork[index].email,
                          secondary: true),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/profile_page/mutual.png'),
                            const SizedBox(
                              width: 5,
                            ),
                            TextCustom('8 Mutuals', secondary: true)
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/icons/profile_page/add_friend.png'),
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
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
