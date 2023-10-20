import 'package:flutter/material.dart';
import 'package:flutter_blog/data/mock/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/bottom_icon.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 수정합니다.
class PostList extends ConsumerWidget {
  const PostList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListModel? model = ref.watch(postListProvider);
    List<Post> posts = [];
    if (model == null) {
      CircularProgressIndicator();
    }

    if (model != null) {
      CircularProgressIndicator();
      posts = model.posts;
    }
    print("posts 크기 : ${posts.length}");
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailPage(index: index)));
              },
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
