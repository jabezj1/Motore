import 'package:flutter/material.dart';
import 'package:motore/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

final AuthService _auth = AuthService();

class _ProfileState extends State<Profile> {
  bool read = true;
  Color _iconColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 206, 232),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 165,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 206, 232),
                image: DecorationImage(
                  image: AssetImage("lib/icons/car.png"),
                  fit: BoxFit.scaleDown,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF04589A),
                    offset: Offset(7, 7),
                    blurRadius: 6,
                  )
                ]),
          ),
          SizedBox(height: 60),
          Row(
            children: [
              ProfileRow(title: 'Name', value: 'John Doe'),
              ProfileRow(title: 'Email', value: 'admin@gmail.com'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ProfileRow(title: 'Year', value: '2017'),
              ProfileRow(title: 'Make', value: 'Maserati'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ProfileRow(title: 'Model', value: 'Ghibli'),
              ProfileRow(title: 'Odometer', value: '27,754 miles'),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.logout),
                label: Text(
                  'Log Out',
                ),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,

      //height: 10,
      //color: Color.fromARGB(255, 199, 210, 215),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.lock_outline,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
