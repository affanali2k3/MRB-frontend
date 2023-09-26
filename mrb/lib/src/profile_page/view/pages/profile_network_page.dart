import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/agent_widget.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_state.dart';

class ProfileNetworkPage extends StatelessWidget {
  const ProfileNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileNetworkPageBloc, ProfileNetworkPageState>(
        builder: (context, state) {
      if (state is ProfileNetworkPageSuccessState) {
        return SingleChildScrollView(
          child: ListView.builder(
              itemCount: state.userNetwork.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  CustomAgentWidget(agent: state.userNetwork[index])),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
