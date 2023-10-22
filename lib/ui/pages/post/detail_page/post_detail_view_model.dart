import 'package:flutter_blog/data/dto/post_response.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고 데이터
class PostDetailModel {
  PostDetailPageResponse postDetailPageResponse;
  PostDetailModel(this.postDetailPageResponse);
}

// 창고
class PostDetailViewModel extends StateNotifier<PostDetailModel?> {
  PostDetailViewModel(this.ref, super.state);
  final Ref ref;

  Future<void> notifyInit(int id) async {
    ResponseDTO responseDTO = await PostRepository().fetchPostDetail(
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0NzE0MDN9._CPg5nVs4u1fcAmevZQysaB8dCHmupzikM35d9zzXTciP1yeT-H7aJ5BBcS6ZXv-N64dnh8h_rgju16JnPHuOA",
      id,
    );
    state = PostDetailModel(responseDTO.data);
  }
}

// 3. 창고 관리자
final postDetailProvider =
    StateNotifierProvider.autoDispose<PostDetailViewModel, PostDetailModel?>(
        (ref) {
  Logger().d("나 실행됨 ? postDetailProvider");
  int postId = ref.read(paramProvider).postDetailId!;
  return PostDetailViewModel(ref, null)..notifyInit(postId);
});
