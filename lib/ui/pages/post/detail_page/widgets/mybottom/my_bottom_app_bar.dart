import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/mybottom/my_elevated_button.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2.0,
      color: Colors.white, // 바텀 앱바의 배경색을 지정합니다.
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 1,
              height: 70,
              color: Colors.white12,
            ),
          ),
          Expanded(
            flex: 1,
            child: MyElevatedButton("전화하기"),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: MyElevatedButton("채팅하기"),
          )
        ],
      ),
    );
  }
}
