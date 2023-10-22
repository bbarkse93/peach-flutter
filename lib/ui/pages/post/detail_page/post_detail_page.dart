import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/post_response.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/mybottom/my_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/myproduct/MyProductNamaAndContent.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/myuserinfo/my_user_info.dart';
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
                      return Image.network(
                          "https://picsum.photos/id/${index + 1}/200/300",
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
                      child: MyUserInfo("${post.productName}",
                          "${post.productName}", "${post.productName}"),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: MyProductNameAndContent(
                      "${post.productName}", "${post.price}", "${post.price}"),
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
