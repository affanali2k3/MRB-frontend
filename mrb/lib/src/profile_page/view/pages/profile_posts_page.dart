import 'package:flutter/material.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfilePostsPage extends StatelessWidget {
  const ProfilePostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration:
              const BoxDecoration(color: CustomTheme.nightTertiaryColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        TextCustom('Ahmed Ali'),
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
                  TextCustom('229 '),
                  TextCustom('Likes'),
                  const SizedBox(
                    width: 20,
                  ),
                  TextCustom('200 '),
                  TextCustom('Comments'),
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
      },
    );
  }
}
