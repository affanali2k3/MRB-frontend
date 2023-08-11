import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_bloc.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_state.dart';

class UserTimelinePage extends StatelessWidget {
  const UserTimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<UserTimelineBloc, UserTimelineState>(
        builder: (context, state) {
      print(state);
      if (state is UserTimelineLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserTimelineFailureState) {
        customSnackBar(message: state.error, context: context);
        return Container();
      } else if (state is UserTimelineSuccessState) {
        customSnackBar(message: state.message, context: context);

        return SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return Container(
                // height: 900,
                child: Column(
                  children: [
                    // Image.memory(state.posts[index].images[0].)
                    SizedBox(
                        height: 100,
                        width: 300,
                        child: Image.network(
                            '${GlobalVariables.url}/post/${FirebaseAuth.instance.currentUser!.email}/${state.posts[index].name}/${state.posts[index].imagesName[0]}')),
                    Text(state.posts[index].text ?? "")
                  ],
                ),
              );
            },
          ),
        );
      } else {
        return Container();
      }
    }));
  }
}
