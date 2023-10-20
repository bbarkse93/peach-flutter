import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String location;
  const AppBarTitle({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(location, style: TextStyle(color: Colors.black)),
          Icon(Icons.arrow_drop_down, color: Colors.black)
        ],
      ),
    );
  }
}
