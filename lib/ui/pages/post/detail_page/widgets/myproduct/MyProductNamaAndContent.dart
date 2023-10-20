import 'package:flutter/material.dart';

class MyProductNameAndContent extends StatelessWidget {
  String productName;
  String created;
  String content;

  MyProductNameAndContent(this.productName, this.created, this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(color: Colors.white12, width: double.infinity, height: 2),
        SizedBox(height: 10),
        Text(
          "${productName}",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        Text(
          "${created}",
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 20),
        Text(
            "${content}",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ],
    );
  }
}
