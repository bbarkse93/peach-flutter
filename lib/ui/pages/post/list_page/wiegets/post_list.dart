import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/bottom_icon.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_item.dart';

// 수정합니다.
class PostList extends StatelessWidget {
  List<Post> posts = [
    Post(
      id: 1,
      productName: "카본 로드자전거 팝니다.",
      price: 200000,
      category: "자전거",
      productPicUrl: "null",
      content: "1년탄 자전거 팝니다.",
      created: "2023-10-23",
      user: User(id: 1, username: "ssar", password: 1234, userPicUrl: "ssar.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
    Post(
      id: 2,
      productName: "파티션 팝니다.",
      price: 200000,
      category: "행사",
      productPicUrl: "null",
      content: "파티션 이쁘게 해드려요!",
      created: "2023-10-22",
      user: User(id: 1, username: "ssar", password: 1234, userPicUrl: "ssar.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
    Post(
      id: 3,
      productName: "책 필요하신분",
      price: 200000,
      category: "책",
      productPicUrl: "null",
      content: "중고서적 팔아요",
      created: "2023-10-22",
      user: User(id: 1, username: "ssar", password: 1234, userPicUrl: "ssar.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
    Post(
      id: 4,
      productName: "벤치프레스",
      price: 200000,
      category: "운동기구",
      productPicUrl: "null",
      content: "벤치프레스 팔아요.",
      created: "2023-10-22",
      user: User(id: 2, username: "cos", password: 1234, userPicUrl: "cos.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
    Post(
      id: 5,
      productName: "견과류 팔아요",
      price: 200000,
      category: "식품",
      productPicUrl: "null",
      content: "블루베리도 포함되어있습니다.",
      created: "2023-10-23",
      user: User(id: 2, username: "cos", password: 1234, userPicUrl: "cos.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
    Post(
      id: 6,
      productName: "장미꽃 팔아요",
      price: 200000,
      category: "꽃",
      productPicUrl: "null",
      content: "장미, 튤립, 패랭이꽃, 등등..",
      created: "2023-10-21",
      user: User(id: 2, username: "cos", password: 1234, userPicUrl: "cos.jpg", location: "vikiniCity", created: "2023-10-20"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: PostItem(
                  ProductImage: posts[index].productPicUrl,
                  PorductName: posts[index].productName,
                  Location: posts[index].user.location,
                  Price: posts[index].price),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
        bottomNavigationBar: BottomIcon(),
      ),
    );
  }
}
