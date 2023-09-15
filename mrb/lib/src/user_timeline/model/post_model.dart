import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PostModel {
  PostModel(
      {required this.text,
      required this.imagesName,
      required this.name,
      required this.likes,
      required this.likeId,
      required this.isLiked,
      required this.postId});

  final int postId;
  final String? text;
  final String name;
  final int? likeId;
  bool isLiked;
  int likes;
  final List<String> imagesName;

  PostModel copyWith(PostModel post) {
    return PostModel(
        likes: post.likes,
        likeId: post.likeId,
        text: post.text,
        imagesName: post.imagesName,
        name: post.name,
        isLiked: post.isLiked,
        postId: post.postId);
  }

  static PostModel fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesList = json['imagesName'];
    return PostModel(
        text: json['text'],
        likeId: json['likeId'],
        isLiked: json['likeId'] == null ? false : true,
        name: json['name'],
        postId: json['postId'],
        likes: json['likes'],
        imagesName: imagesList.map((imgName) {
          return imgName.toString();
        }).toList());
  }
}

class ImageModel {
  ImageModel({required this.image});
  final PlatformFile image;

  static Image fromJson(Map<String, dynamic> json) {
    final List<int> imageData = List<int>.from(json['data']);
    final Uint8List imageDataFinal = Uint8List.fromList(imageData);

    final Image newImage = Image.memory(
      imageDataFinal,
      fit: BoxFit.cover,
    );

    return newImage;
  }
}
