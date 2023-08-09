import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class PostPageState extends Equatable {
  const PostPageState({required this.postText, required this.images});
  final String postText;
  final List<PlatformFile>? images;

  @override
  List<Object?> get props => [postText, images];
}

class PostPageInitialState extends PostPageState {
  const PostPageInitialState({required super.postText, required super.images});
}

class PostPageLoadingState extends PostPageState {
  const PostPageLoadingState({required super.postText, required super.images});
}

class PostPageFailedState extends PostPageState {
  const PostPageFailedState(
      {required super.postText, required super.images, required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}

class PostPageImagesSelectedState extends PostPageState {
  const PostPageImagesSelectedState(
      {required super.postText, required super.images});
}

class PostPageSuccessState extends PostPageState {
  const PostPageSuccessState(
      {required super.postText, required super.images, required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}
