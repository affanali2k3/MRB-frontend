import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_bloc.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_event.dart';
import 'package:mrb/src/post_comments/view/post_comment_view.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_bloc.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_event.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_state.dart';

class UserTimelinePage extends StatelessWidget {
  const UserTimelinePage({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<UserTimelineBloc, UserTimelineState>(
        builder: (context, state) {
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
              return SizedBox(
                // height: 900,
                child: Column(
                  children: [
                    Column(children: [
                      // Image.memory(state.posts[index].images[0].)
                      SizedBox(
                          height: 100,
                          width: 300,
                          child: Image.network(
                              '${GlobalVariables.url}/post/$userEmail/${state.posts[index].name}/${state.posts[index].imagesName[0]}')),
                      Text(state.posts[index].text ?? ""),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<UserTimelineBloc>().add(
                                    UserTimelinePostLikeEvent(
                                        index: index,
                                        postId: state.posts[index].postId));
                              },
                              icon: Icon(Icons.thumb_up,
                                  color: state.posts[index].isLiked
                                      ? Colors.blue
                                      : Colors.black)),
                          Text(state.posts[index].likes.toString()),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<PostCommentsBloc>(context).add(
                                    PostCommentsLoadingEvent(
                                        postId: state.posts[index].postId));
                                showDialog(
                                  context: context,
                                  builder: (context) => PostComments(
                                    postId: state.posts[index].postId,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.comment))
                        ],
                      ),
                    ])
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
