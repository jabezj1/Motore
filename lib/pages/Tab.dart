import 'package:flutter/material.dart';

class MyTab extends StatefulWidget {
  final String iconPath;

  const MyTab({super.key, required this.iconPath});

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(6)),
        child: Image.asset(
          widget.iconPath,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
