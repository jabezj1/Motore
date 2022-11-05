import 'package:flutter/material.dart';

class EngineTile extends StatelessWidget {
  final String partType;
  final String partPrice;
  final tileColor;
  final String imageName;

  final double borderRadius = 12;

  const EngineTile({
    super.key,
    required this.partType,
    required this.partPrice,
    required this.tileColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: tileColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '\$$partPrice',
                    style: TextStyle(
                      color: tileColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            // donut picture
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Image.asset(imageName),
            ),

            // donut flavor
            Text(
              partType,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'CarPart',
              style: TextStyle(color: Colors.grey[600]),
            ),

            // love icon + add button
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // plus button
                  Icon(
                    Icons.add,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
