import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIcon extends StatefulWidget {
  const BottomIcon({
    super.key,
  });

  @override
  State<BottomIcon> createState() => _BottomIconState();
}

class _BottomIconState extends State<BottomIcon> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill),
          label: "홈",
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
            label: "동네생활"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location_circle), label: "내 근처"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2), label: "채팅"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), label: "나의 당근"),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
