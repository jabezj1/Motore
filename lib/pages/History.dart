import 'package:flutter/material.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:motore/pages/createHistoryEntry.dart';

class History extends StatelessWidget {
	const History({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: false,
				title: const Text('History'),
				centerTitle: true,
				elevation: 0,
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(
							colors: [
								Color(0xff15aaaff),
								Color(0xFFADF7F2),
							]
						),
					),
				),
			),
			backgroundColor: Colors.white,
			body: SingleChildScrollView(
				child: Column(
					children: [
						const SizedBox(height: 25),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Row(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Container(
											width: 200,
											height: 120,
											decoration: const BoxDecoration(
												color: Colors.white,
												image: DecorationImage(
													image: AssetImage("lib/icons/car.png"),
													fit: BoxFit.scaleDown,
												),
											),
										),
									],
								),
							],
						),
					],
				),
			),
      		floatingActionButton: FloatingActionButton(
				onPressed:() {
					Navigator.push(
						context, 
						MaterialPageRoute(builder: (context) => const CreateHistoryEntry(title: "title"))
					);
      			}
			),
		);
	}
}