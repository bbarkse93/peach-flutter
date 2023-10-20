import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String ProductImage;
  final String PorductName;
  final String Location;
  final int Price;

  const PostItem({
    super.key,
    required this.ProductImage,
    required this.PorductName,
    required this.Location,
    required this.Price,
  });

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
                child: Image.asset(ProductImage, width: 100, height: 100),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(PorductName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 5),
                      Text(
                        Location,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${Price}",
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
