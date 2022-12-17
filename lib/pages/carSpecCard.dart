import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/carSpec.dart';
import 'package:motore/pages/profile.dart';
import 'Dashboard.dart';

dynamic bord = Colors.blue;
String sellMake = '';
String sellModel = '';

class CarSpecCard extends StatelessWidget {
	final CarSpec _car;
	const CarSpecCard(this._car, {super.key});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				sellMake = _car.make.toString();
				sellModel = _car.model.toString();
				sellNick = _car.nickname.toString();
				index = 4;
				defPage = const Profile();
				Navigator.push(context, MaterialPageRoute(builder: (context) => const Navigation()));

				FirebaseFirestore.instance
					.collection("users")
					.doc(FirebaseAuth.instance.currentUser?.email)
					.set({
						"selected-nick" : sellNick.toString(),
						"selected-make" : sellMake.toString(),
						"selected-model" : sellModel.toString()
					});
			},
			child: Card(
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(18),
					//<-- SEE HERE
				),
				color: Colors.black,
				elevation: 8.0,
				margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
				child: Container(
					decoration: BoxDecoration(
						color: Colors.blue.withOpacity(0.8),
						borderRadius: BorderRadius.circular(18)
					),
					child: ListTile(
						contentPadding: const EdgeInsets.symmetric(
							horizontal: 20.0, 
							vertical: 10.0
						),
						leading: Container(
							padding: const EdgeInsets.only(right: 12.0),
							decoration: const BoxDecoration(
								border: Border(right: BorderSide(width: 1.0, color: Colors.white24))
							),
							child: Image.network(
								"https://cdn-01.imagin.studio/getImage?customer=usmotore&make=${_car.make}&modelFamily=${_car.model}",
								scale: 10,
							)
						),
						title: Text(
							"${_car.nickname}",
							style: const TextStyle(
								color: Colors.black, 
								fontWeight: FontWeight.bold
							),
						),
						// subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
						subtitle: Row(
							children: <Widget>[
								Text(
									"${_car.make} ${_car.model}",
									style: const TextStyle(
										color: Colors.black, 
										fontSize: 10
									)
								),
							],
						),
						trailing: const Icon(
							Icons.keyboard_arrow_right,
							color: Colors.white, size: 30.0
						)
					),
				),
			)
		);
	}
}