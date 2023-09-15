import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/post_model.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';

class ProfilePostsPage extends StatelessWidget {
  const ProfilePostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
      if (state is ProfilePagePostTabState) {
        return SingleChildScrollView(
            child: ListView.builder(
          itemCount: state.posts.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return const CustomPostModel();
          },
        ));
      } else {
        return const SizedBox();
      }
    });
  }
}
