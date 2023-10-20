import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class PostDetailModel {
  Post post;
  PostDetailModel(this.post);
}

// 창고
class PostDetailViewModel extends StateNotifier<PostDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PostDetailViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    Post post = await PostRepository().fetchPostDetail(1);
    state = PostDetailModel(post);
  }
}

// 3. 창고 관리자
final postDetailProvider =
    StateNotifierProvider.autoDispose<PostDetailViewModel, PostDetailModel?>(
        (ref) {
  return PostDetailViewModel(ref, null)..notifyInit();
});
