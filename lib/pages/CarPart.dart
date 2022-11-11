import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  const CarPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.bottomLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         Color(0xff15aaaff),
      //         Color(0xFFADF7F2),
      //       ]),
      // ),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Car Parts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            centerTitle: false,
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
          body: Center(
            child: Container(
                //margin: const EdgeInsets.only(top: 60),
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size(85, 85), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.car_repair), // icon
                                  Text("Wheels"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox.fromSize(
                        size: Size(85, 85), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //ImageIcon(''),
                                  Icon(Icons.car_repair), // icon
                                  Text("Engine"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox.fromSize(
                        size: Size(85, 85), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.car_repair), // icon
                                  Text("Electic"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),

                      SizedBox.fromSize(
                        size: Size(85, 85), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.car_repair), // icon
                                  Text("Cosmetics"),
                                  // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 70,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.red,
                      //   ), //BoxDecoration
                      // ), //Container
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Container(
                      //   width: 70,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.red,
                      //   ), //BoxDecoration
                      // ), //Container
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Container(
                      //   width: 70,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.red,
                      //   ), //BoxDecoration
                      // ), //Container
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Container(
                      //     width: 70,
                      //     height: 70,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.red,
                      //     ) //BoxDecoration
                      //     ) //Container
                    ], //<Widget>[]

                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text('Search for Auto Part Stores'),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: Colors.blue),
                      onPressed: () {},
                    ),
                  ),

                  // Container(
                  //   width: 380,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.blue), //BoxDecoration
                  // ), //Container
                ], //<widget>[]

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              ), //Column
            ) //Padding

                ), //Container
          ) //Center
          ),
    );
  }
}

//WORK IN PROGRESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

// class CarGrid extends StatefulWidget {
//   const CarGrid({Key? key}) : super(key: key);

//   @override
//   _CarGrid createState() => _CarGrid();
// }

// class _CarGrid extends State<CarGrid> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
