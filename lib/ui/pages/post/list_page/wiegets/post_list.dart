import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/mybottom/my_bottom_app_bar.dart';

// 수정합니다.
class PostList extends StatelessWidget {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/avatar.png"),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  "양산",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "양주동",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(color: Colors.white12, width: double.infinity, height: 2),
                    SizedBox(height: 10),
                    Text(
                      "기라티나 띠부실",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    Text(
                      "기타 중고물품, 34분 전",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "가격 제안받습니다 이마트 앞에서 직거래 가능합니다. "
                        "참고로 오늘 나온겁니다 거래하실때 환불안됩니다.",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}
