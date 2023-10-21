// 1. 창고 데이터

import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostListModel {
  List<dynamic> posts;
  PostListModel(this.posts);
}

// 2. 창고
class PostListViewModel extends StateNotifier<PostListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PostListViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    Logger().d("통신을 시작합니다.");
    ResponseDTO productList = await PostRepository().fetchPostList(
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0NzE0MDN9._CPg5nVs4u1fcAmevZQysaB8dCHmupzikM35d9zzXTciP1yeT-H7aJ5BBcS6ZXv-N64dnh8h_rgju16JnPHuOA");

    state = PostListModel(productList.data);
  }
}

// 3. 창고 관리자
final postListProvider =
    StateNotifierProvider.autoDispose<PostListViewModel, PostListModel?>((ref) {
  return PostListViewModel(ref, null)..notifyInit();
});
