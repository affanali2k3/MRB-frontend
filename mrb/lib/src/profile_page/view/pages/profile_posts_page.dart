import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/post_model.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_event_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_state.dart';

class ProfilePostsPage extends StatelessWidget {
  const ProfilePostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePostPageBloc, ProfilePostPageState>(
        builder: (context, state) {
      if (state is ProfilePostPageSuccessState) {
        return SingleChildScrollView(
            child: ListView.builder(
          itemCount: state.posts.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return CustomPostModel(
              post: state.posts[index],
            );
          },
        ));
      } else {
        return const SizedBox();
      }
    });
  }
}
