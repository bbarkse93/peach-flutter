import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/post_response.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:logger/logger.dart';

class PostRepository {
  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      Logger().d("찐 통신시작");
      final response = await dio.get(
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

      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      Logger().d("이번에는$mapList");

      List<PostListPageResponse> PostListPageResponseList =
          mapList.map((e) => PostListPageResponse.fromJson(e)).toList();
      Logger().d("PostListPageResponseList : ${PostListPageResponseList}");

      responseDTO.data = PostListPageResponseList;
      return responseDTO;
    } catch (e) {}

    // responseDTO.data가 null인 경우에 대한 처리를 수행
    return ResponseDTO(-1, "실패", null);
  }

  Future<ResponseDTO> fetchPostDetail(String jwt, int index) async {
    try {
      Logger().d("통신 시작");
      // 통신
      final response = await dio.get(
        "/products/$index",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXIiLCJleHAiOjE2OTg0NzIyOTZ9._dSJrAtl3NVZhWLUzPQkW_XDW1kiasG9b6ER1lT9hegGCYAiAooJco5LtQQ2OpejVQkdn6kxfFrsVZM6pgO0gw"
          },
        ),
      );
      Logger().d("통신 끝");
      Logger().d(response);
      Logger().d(response.headers);
      Logger().d(response.data);

      // 테스트 코드

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("테스팅 / 1. responseDTO : ${responseDTO.data}");

      responseDTO.data = PostDetailPageResponse.fromJson(responseDTO.data);
      Logger().d("테스팅 / 2. responseDTO.data  : ${responseDTO.data.toString()}");

      Logger().d("테스팅 / 3. responseDTO : ${responseDTO}");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, " 실패 ", null);
    }
  }
}
