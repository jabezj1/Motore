import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/MaintenanceItem.dart';

class MaintenanceItemCard extends StatelessWidget {
	final MaintenanceItem _maintenance;

	MaintenanceItemCard(this._maintenance);

	@override 
	Widget build(BuildContext context) {
		return Container(
			child: Card(
				child: Padding(
					padding: const EdgeInsets.all(12.0),
					child: Column(
						children: [
							Row(
								children: [
									Padding(
										padding: const EdgeInsets.only(bottom: 10.0),
										child: Text(_maintenance.system.toString()),	
									)
								],
							),
							Row(
								children: [
									Text(
										"Miles remaining: ${_maintenance.miles.toString()}"
									)
								],
							)
						],
					),
				)
			)
		);
	}
}