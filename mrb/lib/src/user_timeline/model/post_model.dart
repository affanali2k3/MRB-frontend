import 'package:file_picker/file_picker.dart';

class PostModel {
  PostModel({required this.text, required this.images});
  final String text;
  final List<PlatformFile>? images;

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
        text: json['text'],
        images: json['images'].map((e) => ImageModel.fromJson(e)).toList());
  }
}

class ImageModel {
  ImageModel({required this.image});
  final PlatformFile image;

  static ImageModel fromJson(Map<String, dynamic> json) =>
      ImageModel(image: json['data']);
}
