import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/bloc/search_page_state.dart';

class SearchPageSearchAgentsWidget extends StatelessWidget {
  const SearchPageSearchAgentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
      if (state is SearchPageAgentSearchState) {
        return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: state.agents.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<ProfilePageBloc>().add(ProfilePageLoadingEvent(
                        userId: state.agents[index].id,
                        associateId: GlobalVariables.user.id));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(userId: state.agents[index].id),
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
                              size: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextCustom(state.agents[index].name),
                            TextCustom(state.agents[index].email,
                                secondary: true),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/icons/profile_page/mutual.png'),
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
                ));
      } else {
        return const SizedBox();
      }
    });
  }
}
