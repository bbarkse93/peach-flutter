import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String productPicUrl;
  final String productName;
  final String location;
  final int price;

  PostItem(
      {required this.productPicUrl,
      required this.productName,
      required this.location,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/elements/${productPicUrl}",
                    width: 100, height: 100),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 5),
                      Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "$price",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
