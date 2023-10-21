import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:logger/logger.dart';

class PostRepository {
  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      Logger().d("찐 통신시작");
      Response<dynamic> response = await dio.get(
        "/products",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0NzIyOTZ9._dSJrAtl3NVZhWLUzPQkW_XDW1kiasG9b6ER1lT9hegGCYAiAooJco5LtQQ2OpejVQkdn6kxfFrsVZM6pgO0gw"
          },
        ),
      );
      Logger().d("통신 끝!");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);
      Logger().d("responseDTO.data: ${responseDTO.data}");

      List<dynamic> postList = responseDTO.data as List<dynamic>;
      Logger().d("이번에는$postList");
      // List<Post> posts =
      //     postList.map((postList) => Post.fromJson(postList)).toList();

      responseDTO.data = postList;
      // Logger().d("repostiory: ${responseDTO.data}");
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
