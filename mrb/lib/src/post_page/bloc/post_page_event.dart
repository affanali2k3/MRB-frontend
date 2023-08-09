import 'package:equatable/equatable.dart';

class PostPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostPageImagesSelectEvent extends PostPageEvent {}

class PostPageSubmitEvent extends PostPageEvent {
  PostPageSubmitEvent({required this.postText});
  final String postText;
}
