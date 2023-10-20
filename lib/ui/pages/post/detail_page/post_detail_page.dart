import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/mybottom/my_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/myproduct/MyProductNamaAndContent.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/myuserinfo/my_user_info.dart';

// 수정합니다.
class PostDetailPage extends StatelessWidget {
  Post post = Post(
    id: 1,
    productName: "카본 로드자전거 팝니다.",
    price: 200000,
    category: "자전거",
    productPicUrl: "null",
    content: "1년탄 자전거 팝니다.",
    created: "2023-10-23",
    user: User(id: 1, username: "ssar", password: 1234, userPicUrl: "ssar.jpg", location: "vikiniCity", created: "2023-10-20"),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                automaticallyImplyLeading: true,
                leading: Icon(Icons.arrow_back),
                flexibleSpace: PageView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Image.network("https://picsum.photos/id/${index + 1}/200/300", fit: BoxFit.cover);
                  },
                ),
                actions: [
                  Icon(Icons.add_box_rounded),
                  SizedBox(width: 25.0),
                  Icon(Icons.add_a_photo_sharp),
                  SizedBox(width: 25.0),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: MyUserInfo("${post.user.userPicUrl}", "${post.user.username}", "${post.user.location}"),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: MyProductNameAndContent("${post.productName}", "${post.created}", "${post.content}"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}
