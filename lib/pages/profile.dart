import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool read = true;
  Color _iconColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Profile Page',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 206, 232),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          " Name: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  color: _iconColor,
                                  onPressed: () => setState(() {
                                        read = false;
                                      }),
                                  icon: Icon(Icons.account_box))),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: " John Doe",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          " Car Make: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: " Toyota",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          " Car Model: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: " Prius",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          " License Number: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: "",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          " License Plate: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: "",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          " Registration Expiry Date: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: read,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onEditingComplete: () {
                            setState(() {
                              read = true;
                            });
                          },
                          initialValue: "",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                  ]),
            ),
          ],
        ));
  }
}
