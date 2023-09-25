class UserPostModel {
  final int id;
  final int likes;
  final int comments;
  final String posterName;
  final String postName;
  final int? likeId;
  final String text;
  final int userId;
  final DateTime createdAt;
  final List<dynamic> imagesName;

  UserPostModel(
      {required this.id,
      required this.postName,
      required this.comments,
      required this.posterName,
      required this.likeId,
      required this.createdAt,
      required this.imagesName,
      required this.likes,
      required this.text,
      required this.userId});

  static UserPostModel fromJson(Map<String, dynamic> json) => UserPostModel(
      id: json['postId'],
      likeId: json['likeId'],
      postName: json['name'],
      posterName: json['posterName'],
      comments: json['comments'],
      createdAt: DateTime.parse(json['createdAt']),
      imagesName: json['imagesName'],
      likes: json['likes'],
      text: json['text'],
      userId: json['userId']);
}
