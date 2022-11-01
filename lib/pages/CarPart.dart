import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  const CarPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Parts',
          //style: TextStyle(fontFamily: ),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF15AAAFF),
              Color(0xFFADF7F2),
            ]),
          ),
        ),
      ),
    );
  }
}
