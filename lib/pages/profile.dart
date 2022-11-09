import 'package:flutter/material.dart';
import 'package:motore/services/auth.dart';
import 'package:motore/pages/createCarProfile.dart';

const List<String> list = <String>[
  ' Car One',
  ' Car Two',
  ' Car Three',
  ' Car Four',
];

class Profile extends StatefulWidget {
	const Profile({Key? key}) : super(key: key);
	@override
	StateProfile createState() => StateProfile();
}

final AuthService _auth = AuthService();

class StateProfile extends State<Profile> {
	bool read = true;
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: false,
				title: const Text(
					'Profile',
				),
				centerTitle: true,
				elevation: 0,
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(colors: [
							Color(0xff15aaaff),
							Color(0xFFADF7F2),
						]),
					),
				),
			),
			floatingActionButton: Padding(
				padding: const EdgeInsets.only(bottom: 10),
				child: FloatingActionButton(
				onPressed: () {
					Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) => const CreateCarProfile(
								title: "a",
							)
						),
					);
				},
				backgroundColor: Colors.blue,
				child: const Icon(Icons.add),
				),
			),
			body: Column(
				children: [
					Container(
						padding: const EdgeInsets.only(right: 100),
						width: double.infinity,
						height: 165,
						decoration: const BoxDecoration(
							gradient: LinearGradient(colors: [
							Color(0xff15aaaff),
							Color(0xFFADF7F2),
							]),
							//color: Color.fromARGB(255, 150, 206, 232),
                  image: DecorationImage(
                    image: AssetImage("lib/icons/car2.png"),
                    fit: BoxFit.none,
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
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            //value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.red,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              // setState(() {
              //   dropdownValue = value!;
              // }
              //);
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              ProfileRow(title: 'Name', value: 'John Doe'),
              ProfileRow(title: 'Email', value: 'admin@gmail.com'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              ProfileRow(title: 'Year', value: '2017'),
              ProfileRow(title: 'Make', value: 'Maserati'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              ProfileRow(title: 'Model', value: 'Ghibli'),
              ProfileRow(title: 'Odometer', value: '27,754 miles'),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  // await _auth.emailsignOut();
                },
                icon: Icon(Icons.logout),
                label: const Text(
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
                child: const Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Align(
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
