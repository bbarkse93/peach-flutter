import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/post_response.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/mybottom/my_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/myproduct/MyProductNamaAndContent.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 수정합니다.
class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailModel? model = ref.watch(postDetailProvider);
    if (model == null) {
      Logger().d("모델은 null");
      return CircularProgressIndicator();
    } else {
      PostDetailPageResponse post = model.postDetailPageResponse;
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  automaticallyImplyLeading: true,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                  flexibleSpace: PageView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Image.asset(
                          "assets/images/elements/${post.productPicUrl}",
                          fit: BoxFit.cover);
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
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/profiles/${post.user.userPicUrl}",
                            ),
                          ),
                        ),
                        title: Text(
                          "${post.user.username}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${post.user.location}",
                          style: TextStyle(fontSize: 16, color: Colors.black26),
                        ),
                      ),
                      // child: MyUserInfo(
                      //     "assets/images/profiles/${post.user.userPicUrl}",
                      //     "${post.user.username}",
                      //     "${post.user.location}")
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: MyProductNameAndContent("${post.productName}",
                      "금액: ${post.price}", "${post.content}"),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomAppBar(),
        ),
      );
    }
  }
}
