// 1. 창고 데이터
import 'package:flutter_blog/data/mock/post.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListModel {
  List<Post> posts;
  PostListModel(this.posts);
}

// 2. 창고
class PostListViewModel extends StateNotifier<PostListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PostListViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    print("통신 시작");
    List<Post> productList = await PostRepository().fetchPostList();
    print("통신 끝 ${productList.length}");
    state = PostListModel(posts);
  }
}

// 3. 창고 관리자
final postListProvider = StateNotifierProvider.autoDispose<PostListViewModel, PostListModel?>((ref) {
  return PostListViewModel(ref, null)..notifyInit();
});
