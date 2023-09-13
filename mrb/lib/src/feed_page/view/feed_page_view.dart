import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

// ignore: must_be_immutable
class FeedPage extends StatelessWidget {
  FeedPage({Key? key, required this.userId}) : super(key: key);
  final int userId;
  int pageNumber = 2;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context
            .read<FeedPageBloc>()
            .add(FeedPageLoadingEvent(userId: userId, pageNumber: pageNumber));
        pageNumber = pageNumber + 1;
      }
    });
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body:
            BlocBuilder<FeedPageBloc, FeedPageState>(builder: (context, state) {
          print(state);
          if (state is FeedPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeedPageFailedState) {
            customSnackBar(message: state.error, context: context);
            return Container();
          } else if (state is FeedPageSuccessState) {
            return ListView.builder(
              controller: _scrollController,
              // shrinkWrap: true,
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: CustomTheme.nightTertiaryColor),
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
                                icon: Image.asset(
                                    'assets/icons/post/comment.png'),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    Image.asset('assets/icons/post/share.png'),
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
                // return SizedBox(
                //   // height: 900,
                //   child: Column(
                //     children: [
                //       Column(children: [
                //         // Image.memory(state.posts[index].images[0].)
                //         SizedBox(
                //             height: 100,
                //             width: 300,
                //             child: state.posts[index].imagesName.isEmpty
                //                 ? null
                //                 : Image.network(
                //                     '${GlobalVariables.url}/post/${state.posts[index].userEmail}/${state.posts[index].name}/${state.posts[index].imagesName[0]}')),
                //         Text(state.posts[index].text ?? ""),
                //         Row(
                //           children: [
                //             IconButton(
                //                 onPressed: () {
                //                   // context.read<UserTimelineBloc>().add(
                //                   //     UserTimelinePostLikeEvent(
                //                   //         index: index,
                //                   //         postId: state.posts[index].postId));
                //                 },
                //                 icon: Icon(Icons.thumb_up,
                //                     color: state.posts[index].isLiked
                //                         ? Colors.blue
                //                         : Colors.black)),
                //             Text(state.posts[index].likes.toString()),
                //             IconButton(
                //                 onPressed: () {
                //                   BlocProvider.of<PostCommentsBloc>(context)
                //                       .add(PostCommentsLoadingEvent(
                //                           postId: state.posts[index].postId));
                //                   showDialog(
                //                     context: context,
                //                     builder: (context) => PostComments(
                //                       postId: state.posts[index].postId,
                //                     ),
                //                   );
                //                 },
                //                 icon: const Icon(Icons.comment))
                //           ],
                //         ),
                //       ])
                //     ],
                //   ),
                // );
              },
            );
          } else {
            return Container();
          }
        }));
  }
}
