import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  final IconData icon;
  const AppBarAction({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
    );
  }
}
