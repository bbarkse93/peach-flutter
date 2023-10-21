import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/app_bar_action.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/app_bar_title.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: AppBarTitle(location: "진구"),
        actions: [
          AppBarAction(icon: Icons.search),
          AppBarAction(icon: Icons.tune),
          AppBarAction(icon: Icons.add_alert_outlined),
        ],
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          ref.read(postListProvider.notifier).notifyInit();
        },
        child: PostList(),
      ),
    );
  }
}
