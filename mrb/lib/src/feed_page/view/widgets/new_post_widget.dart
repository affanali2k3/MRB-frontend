import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/post_page/bloc/post_page_bloc.dart';
import 'package:mrb/src/post_page/bloc/post_page_event.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class FeedPageNewPostWidget extends StatefulWidget {
  const FeedPageNewPostWidget({Key? key}) : super(key: key);

  @override
  FeedPageNewPostWidgetState createState() => FeedPageNewPostWidgetState();
}

class FeedPageNewPostWidgetState extends State<FeedPageNewPostWidget> {
  FeedPageNewPostWidgetState({Key? key});

  final _postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const CustomProfilePhoto(
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      TextCustom('Ahmad Ali'),
                      Container(
                        width: 110,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xffE2E2E2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: [
                          Image.asset(
                              'assets/icons/referral_centre/public.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Public'),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset('assets/icons/referral_centre/down.png'),
                        ]),
                      ),
                    ],
                  ),
                ]),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Image.asset('assets/icons/feed_page/close.png'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _postTextController,
              maxLines: 10,
              style:
                  const TextStyle(color: CustomTheme.nightSecondaryFontColor),
              decoration: InputDecoration(
                  hintText: 'What are you thinking...',
                  hintStyle: const TextStyle(
                      color: CustomTheme.nightSecondaryFontColor),
                  filled: true,
                  fillColor: CustomTheme.nightAppbarColor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () =>
                  context.read<PostPageBloc>().add(PostPageImagesSelectEvent()),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xff4B4B4B),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset('assets/icons/feed_page/photo.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    TextCustom('Photo')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<PostPageBloc>().add(
                      PostPageSubmitEvent(postText: _postTextController.text));
                },
                text: 'Post')
          ],
        ),
      ),
    );
  }
}
