import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/post_page/bloc/post_page_bloc.dart';
import 'package:mrb/src/post_page/bloc/post_page_event.dart';
import 'package:mrb/src/post_page/bloc/post_page_state.dart';

class PostPage extends StatelessWidget {
  PostPage({Key? key}) : super(key: key);
  final _postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<PostPageBloc, PostPageState>(builder: (context, state) {
        if (state is PostPageLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostPageFailedState) {
          customSnackBar(message: state.error, context: context);
        } else if (state is PostPageImagesSelectedState) {
          customSnackBar(
              message: 'Uploaded images succesfully', context: context);
        } else if (state is PostPageSuccessState) {
          customSnackBar(message: state.message, context: context);
        }
        return Column(
          children: [
            CustomTextField(controller: _postTextController, hintText: 'Text'),
            CustomOutlineButton(
                onPressed: () => context
                    .read<PostPageBloc>()
                    .add(PostPageImagesSelectEvent()),
                text: 'Images'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
              onPressed: () => context
                  .read<PostPageBloc>()
                  .add(PostPageSubmitEvent(postText: _postTextController.text)),
              text: 'Post',
              primary: false,
            )
          ],
        );
      })),
    );
  }
}
