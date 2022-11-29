import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/CarListItem.dart';

class CarListItemCard extends StatelessWidget {
 	final CarListItem _carListItem;

  	CarListItemCard(this._carListItem);

	@override
	Widget build(BuildContext context) {
		return Card(
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
		);
	}
}
