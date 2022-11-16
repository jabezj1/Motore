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
								children: [
									Padding(
										padding: const EdgeInsets.only(bottom: 10.0),
										child: Text(_historyItem.title.toString())
									)
								],
							),
							Row(
								children: [
									Text(_historyItem.cost.toString())
								],
							)
						],
					)
				),
			),
		);
    }
}