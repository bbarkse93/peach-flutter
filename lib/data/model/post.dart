import 'package:flutter_blog/data/model/user.dart';

class Post {
  final int id;
  final String productName;
  final int price;
  final String category;
  final String content;
  final String productPicUrl;
  final String created;
  final User user;

  Post({
    required this.id,
    required this.productName,
    required this.price,
    required this.category,
    required this.content,
    required this.productPicUrl,
    required this.created,
    required this.user,
  });

// Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "category": category,
        "content": content,
        "productPicUrl": productPicUrl,
        "created": created,
        "user": user,
      };

// Map 형태로 받아서 Dart 객체로 변환합니다.
  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productName = json["productName"],
        price = json["price"],
        category = json["category"],
        content = json["content"],
        productPicUrl = json["productPicUrl"],
        created = json["created"],
        user = User.fromJson(json["user"]);
}
