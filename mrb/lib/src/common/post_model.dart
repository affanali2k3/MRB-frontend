import 'package:flutter/material.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomPostModel extends StatelessWidget {
  const CustomPostModel({Key? key, required this.post}) : super(key: key);

  final UserPostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
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
            height: 200,
            color: Colors.red,
            child: Image.network(
                '${GlobalVariables.url}/post/post-image?userId=${post.userId}&postName=${post.postName}&imageName=${post.imagesName.first}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
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
              TextCustom(' Likes'),
              const SizedBox(
                width: 20,
              ),
              TextCustom(post.comments.toString()),
              TextCustom(' Comments'),
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
