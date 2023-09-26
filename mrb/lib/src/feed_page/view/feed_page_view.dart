import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/post_model.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
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
          if (state is FeedPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeedPageFailedState) {
            customSnackBar(message: state.error, context: context);
            return Container();
          } else if (state is FeedPageSuccessState) {
            return SafeArea(
              minimum: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTopBarWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return CustomPostModel(post: state.posts[index]);
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
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        }));
  }
}
