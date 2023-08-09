import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/post_page/bloc/post_page_event.dart';
import 'package:mrb/src/post_page/bloc/post_page_state.dart';
import 'package:mrb/src/post_page/repository/post_page_repository.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';

class PostPageBloc extends Bloc<PostPageEvent, PostPageState> {
  PostPageBloc({required this.repository})
      : super(const PostPageInitialState(postText: '', images: [])) {
    on<PostPageSubmitEvent>(_submit);
    on<PostPageImagesSelectEvent>(_selectImages);
  }

  final PostPageRepository repository;

  void _submit(PostPageSubmitEvent event, emit) async {
    try {
      emit(
          PostPageLoadingState(postText: state.postText, images: state.images));
      await repository.submit(
          images: state.images,
          postText: event.postText,
          userEmail: FirebaseAuth.instance.currentUser!.email!);

      emit(PostPageSuccessState(
          postText: state.postText, images: state.images, message: 'Success'));
    } catch (e) {
      emit(PostPageFailedState(
          postText: state.postText, images: state.images, error: e.toString()));
    }
  }

  void _selectImages(PostPageImagesSelectEvent event, emit) async {
    emit(PostPageLoadingState(postText: state.postText, images: state.images));
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, withData: true);

    if (result != null) {
      emit(PostPageImagesSelectedState(
          postText: state.postText, images: result.files));
    }
  }
}
