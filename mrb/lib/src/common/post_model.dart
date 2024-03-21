import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_bloc.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_event.dart';
import 'package:mrb/src/post_comments/view/post_comment_view.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomPostModel extends StatelessWidget {
  const CustomPostModel({Key? key, required this.post}) : super(key: key);

  final UserPostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: CustomTheme.nightTertiaryColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const CustomProfilePhoto(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(post.posterName),
                    TextCustom('London, UK')
                  ],
                )
              ]),
              Container(
                decoration: BoxDecoration(
                    color: CustomTheme.nightSecondaryColor,
                    borderRadius: BorderRadius.circular(40)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: post.imagesName == null
                ? const SizedBox()
                : post.imagesName!.isEmpty
                    ? null
                    : Image.network(
                        '${GlobalVariables.url}/post/post-image?userId=${post.userId}&postName=${post.postName}&imageName=${post.imagesName!.first}'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [TextCustom(post.text ?? "No text")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<FeedPageBloc>().add(FeedPageLikePostEvent(
                          userId: post.userId, postId: post.id));
                    },
                    icon: Image.asset('assets/icons/post/like.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/post/comment.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/post/share.png'),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/post/save.png'))
            ],
          ),
          Row(
            children: [
              TextCustom(post.likes.toString()),
              TextCustom(' Likes', secondary: true),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<PostCommentsBloc>()
                      .add(PostCommentsLoadingEvent(postId: post.id));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostComments(postId: post.id),
                      ));
                },
                child: Row(
                  children: [
                    TextCustom(post.comments.toString()),
                    TextCustom(' Comments', secondary: true),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: CustomTheme.nightSecondaryColor,
                focusColor: CustomTheme.nightSecondaryColor,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: 'Your Comment..',
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: CustomTheme.nightSecondaryColor),
                    borderRadius: BorderRadius.circular(20))),
          )
        ],
      ),
    );
  }
}
