class CommentModel {
  CommentModel(
      {required this.id,
      required this.postId,
      required this.userId,
      required this.text});
  final int id;
  final int postId;
  final int userId;
  final String text;

  static CommentModel fromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'],
      postId: json['postId'],
      userId: json['userId'],
      text: json['text']);
}
