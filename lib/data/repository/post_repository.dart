import 'package:flutter_blog/data/mock/post.dart';

class PostRepository {
  Future<List<Post>> fetchPostList() {
    return Future.delayed(Duration(seconds: 3), () => posts);
  }

  Future<Post> fetchPostDetail() {
    return Future.delayed(Duration(seconds: 3), () => post);
  }
}
