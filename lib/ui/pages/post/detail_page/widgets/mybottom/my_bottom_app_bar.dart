import 'package:flutter/material.dart';

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
            child: MyElevatedButton(),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("채팅하기", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.deepOrange,
                minimumSize: Size(100, 45),
              ),
            ),
          )
        ],
      ),
    );
  }
}
