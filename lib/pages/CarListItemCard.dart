import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/CarListItem.dart';
import 'package:motore/pages/createCarProfile.dart';
import 'package:motore/pages/profile.dart';

class CarListItemCard extends StatelessWidget {
 	final CarListItem _carListItem;

  	const CarListItemCard(this._carListItem, {super.key});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			child: Card(
				child: Padding(
					padding: const EdgeInsets.all(12.0),
					child: Row(
						children: [
							Padding(
								padding: const EdgeInsets.only(top: 10, left: 20),
								child: Text(
									_carListItem.nickname.toString(),
									style: const TextStyle(
										color: Colors.black,
										fontSize: 15,
										fontWeight: FontWeight.bold,
									),
								),
							)
						]
					),
				)
			),
			onTap:() {
				// sets curr_car to nickname of the car item that was tapped
				curr_car = _carListItem.nickname.toString();
				Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));

				// replace above line with a setState() function to rebuild the weidget correctly
			},
    	);
	}
}
