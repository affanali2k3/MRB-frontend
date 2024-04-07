import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/date_format.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_bloc.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_event.dart';
import 'package:mrb/src/post_comments/view/post_comment_view.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomPostModel extends StatefulWidget {
  const CustomPostModel({super.key, required this.post});
  final UserPostModel post;

  @override
  State<CustomPostModel> createState() => _PostModelState();
}

class _PostModelState extends State<CustomPostModel> {
  int postLikes = 0;

  @override
  void initState() {
    super.initState();
    postLikes = widget.post.likes;
  }

  @override
  Widget build(BuildContext context) {
    UserPostModel post = widget.post;

    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: CustomTheme.nightTertiaryColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
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
                      Text(
                        post.posterName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/post/time.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${dateFormat(post.createdAt).number} ${dateFormat(post.createdAt).type} ago',
                            style: const TextStyle(
                                color: CustomTheme.tertiaryFontColor,
                                fontSize: 12),
                          )
                        ],
                      )
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
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [TextCustom(post.text ?? "No text")],
            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/post/likes.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    TextCustom(postLikes.toString()),
                  ],
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
                  child: Text('${post.comments.toString()} comments'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.read<FeedPageBloc>().add(FeedPageLikePostEvent(
                      userId: post.userId, postId: post.id));

                  setState(() {
                    postLikes = postLikes + 1;
                  });
                },
                icon: Column(
                  children: [
                    Image.asset('assets/icons/post/like.png'),
                    const Text('Like')
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(
                  children: [
                    Image.asset('assets/icons/post/comment.png'),
                    const Text('Comment')
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(
                  children: [
                    Image.asset('assets/icons/post/share.png'),
                    const Text('Share')
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(
                  children: [
                    Image.asset('assets/icons/post/send.png'),
                    const Text('Send')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
