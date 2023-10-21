import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_page.dart';

class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String postListPage = "/post/list";
  static String userInfoPage = "/user/info";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.loginPage: (context) => const LoginPage(),
    // Move.joinPage: (context) => const JoinPage(),
    Move.postListPage: (context) => PostListPage()
  };
}
