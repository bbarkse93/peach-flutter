// 1. 창고 데이터

import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
    ResponseDTO productList = await PostRepository().fetchPostList(
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0MDU4NTZ9.6WHb0IoZWTBJowOUi7mHlfBzR8vk7h5qoAPjCAoEMrXbBD5GcHgfZoEt5pmqGlFryqJn9hYw_WJVZnq1SZLQOw");

    Logger().d("이건가? $productList");

    state = PostListModel(productList.data);

    // productList가 null일 때의 처리
    Logger().d("API 응답이 null입니다.");
  }
}

// 3. 창고 관리자
final postListProvider =
    StateNotifierProvider.autoDispose<PostListViewModel, PostListModel?>((ref) {
  return PostListViewModel(ref, null)..notifyInit();
});
