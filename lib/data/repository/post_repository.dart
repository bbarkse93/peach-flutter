import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

class PostRepository {
  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      Logger().d("찐 통신시작");
      Response<dynamic> response = await dio.get("/products",
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0MDU4NTZ9.6WHb0IoZWTBJowOUi7mHlfBzR8vk7h5qoAPjCAoEMrXbBD5GcHgfZoEt5pmqGlFryqJn9hYw_WJVZnq1SZLQOw"
          }));
      Logger().d("통신 끝!");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("여기");
      responseDTO.data = User.fromJson(responseDTO.data);

      List<dynamic> bodyList = response.data as List<dynamic>;
      Logger().d(bodyList);
      List<Post> postList = bodyList.map((e) => Post.fromJson(e)).toList();

      responseDTO.data = postList;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "실패", null);
    }
  }

  Future<Post> fetchPostDetail(int id) async {
    Response<dynamic> response = await dio.get("/products/$id");

    Map<String, dynamic> body = response.data as Map<String, dynamic>;

    Post post = Post.fromJson(body);
    return post;
  }
}
