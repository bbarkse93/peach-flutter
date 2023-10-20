import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  String buttonText;

  MyElevatedButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("${buttonText}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.deepOrange,
        minimumSize: Size(100, 45),
      ),
    );
  }
}
