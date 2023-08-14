import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_bloc.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_event.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_state.dart';

class PostComments extends StatelessWidget {
  PostComments({super.key, required this.postId});

  final _commentController = TextEditingController();
  final String postId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentsBloc, PostCommentsState>(
      builder: (context, state) {
        if (state is PostCommentsLoadingState) {
          return const SizedBox(
            height: 300,
            child: AlertDialog(
              content: CircularProgressIndicator(),
            ),
          );
        } else if (state is PostCommentFailedState) {
          customSnackBar(message: state.error, context: context);
        }
        if (state is PostCommentSuccessState) {
          return Dialog(
            child: Container(
                height: 200,
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) =>
                          Text(state.comments[index].text),
                    ),
                  ),
                  Row(children: [
                    SizedBox(
                        width: 250,
                        child: CustomTextField(
                            controller: _commentController,
                            hintText: 'Comment')),
                    IconButton(
                        onPressed: () {
                          context.read<PostCommentsBloc>().add(
                              PostCommentsSaveCommentEvent(
                                  comment: _commentController.text,
                                  postId: postId));
                        },
                        icon: const Icon(Icons.send))
                  ])
                ])),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
