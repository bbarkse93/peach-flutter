import 'package:flutter_blog/data/model/user.dart';

class PostListPageResponse {
  final int? id;
  final String? productName;
  final int? price;
  final String? category;
  final String? productPicUrl;

  PostListPageResponse(
      {this.id,
      this.productName,
      this.price,
      this.category,
      this.productPicUrl});

  PostListPageResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productName = json["productName"],
        price = json["price"],
        category = json["category"],
        productPicUrl = json["productPicUrl"];
}

class PostDetailPageResponse {
  final int id;
  final String productName;
  final int price;
  final String category;
  final String content;
  final String productPicUrl;
  final User user;

  PostDetailPageResponse({
    required this.id,
    required this.productName,
    required this.price,
    required this.category,
    required this.content,
    required this.productPicUrl,
    required this.user,
  });

// Map 형태로 받아서 Dart 객체로 변환합니다.
  PostDetailPageResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productName = json["productName"],
        price = json["price"],
        category = json["category"],
        content = json["content"],
        productPicUrl = json["productPicUrl"],
        user = User.fromJson(json["user"]);
}
