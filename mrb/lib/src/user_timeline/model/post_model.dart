import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PostModel {
  PostModel({required this.text, required this.imagesName, required this.name});
  final String? text;
  final String name;
  final List<String> imagesName;

  static PostModel fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesList = json['imagesName'];
    return PostModel(
        text: json['text'],
        name: json['name'],
        imagesName: imagesList.map((imgName) {
          return imgName.toString();
        }).toList());
    // images: imagesList.map((e) => ImageModel.fromJson(e)).toList());
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
