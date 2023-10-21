import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/bottom_icon.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 수정합니다.
class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListModel? model = ref.watch(postListProvider);
    if (model == null) {
      Logger().d("모델은 null");
      CircularProgressIndicator();
      return SizedBox();
    } else {
      Logger().d("model의 값은? ${model.posts}");
      var posts = model.posts;
      return SafeArea(
        child: Scaffold(
          body: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PostDetailPage(index: index)));
                },
                child: PostItem(
                    productName: posts[0].productName,
                    productPicUrl: posts[0].productPicUrl,
                    location: posts[0].user.location,
                    price: posts[0].price),
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
}
