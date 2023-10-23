import 'package:flutter/material.dart';

class MyUserInfo extends StatelessWidget {
  String imagename;
  String username;
  String location;

  MyUserInfo(this.imagename, this.username, this.location);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Expanded(
            flex: 1,
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profiles/"),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  "${username}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Text(
                  "${location}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
