import 'package:flutter/material.dart';
import 'package:mrb/src/post_page/view/post_page_view.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostPage()));
          },
          child: Text('Post')),
      body: const Center(
        child: Text('Feed'),
      ),
    );
  }
}
