class CommentModel {
  CommentModel(
      {required this.id,
      required this.postId,
      required this.userEmail,
      required this.text});
  final int id;
  final int postId;
  final String userEmail;
  final String text;

  static CommentModel fromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'],
      postId: json['postId'],
      userEmail: json['userEmail'],
      text: json['text']);
}
