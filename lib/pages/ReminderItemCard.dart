import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/ReminderItem.dart';

class ReminderItemCard extends StatelessWidget {
	final ReminderItem _reminder;

	ReminderItemCard(this._reminder);

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
										child: Text(_reminder.title.toString()),	
									)
								],
							),
							Row(
								children: [
									Text(
										"Days left: ${_reminder.days.toString()}"
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