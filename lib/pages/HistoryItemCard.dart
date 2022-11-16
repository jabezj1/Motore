import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motore/pages/HistoryItem.dart';

class HistoryItemCard extends StatelessWidget {
    final HistoryItem _historyItem;
	const HistoryItemCard(this._historyItem, {super.key});

    @override
    Widget build(BuildContext context) {
		return Container(
			child: Card(
				child: Padding(
					padding: const EdgeInsets.all(12.0),
					child: Column(
						children: [
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween, // forces children in row to split left & right
								children: [
									Column(
										children: [
											Padding(
												padding: const EdgeInsets.only(bottom: 10.0),
												child: Text(_historyItem.title!.toUpperCase().toString()) // title of maintenance
											),
											Padding(
												padding: const EdgeInsets.only(top: 10.0, left: 20.0),
												child: Text(_historyItem.notes.toString()) // notes that go under the title
											),
											Padding(
												padding: const EdgeInsets.only(top: 10),
												child: Row(
													children: [
														const Text("LOCATION: "),
														Text(_historyItem.location.toString())
													],
												),
											)
										],
									),
									Column(
										children: [
											Padding(
												padding: const EdgeInsets.only(bottom: 10.0),
												child: Row(
													children: [
														const Text("\$"),
														Text(_historyItem.cost.toString()), // cost of the maintenance, far right side
													],
												)
											),
										],
									)
								],
							),
						],
					)
				),
			),
		);
    }
}