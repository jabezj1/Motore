import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/GasItem.dart';
import 'package:motore/pages/GasItemCard.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/HistoryItem.dart';
import 'package:motore/pages/HistoryItemCard.dart';
import 'package:motore/pages/createGasExpense.dart';

class InspectGas extends StatefulWidget {
    const InspectGas({super.key});

    @override
    State<InspectGas> createState() => _InspectGasState();
}

class _InspectGasState extends State<InspectGas> {
	List<Object> _pastGas = []; // haha get it?? because farts??

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getPastGasList();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: true,
				title: const Text("Gas Expenses"),
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
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.push(
						context,
						MaterialPageRoute(builder: (context) => CreateGasExpense(title: "title"))
					);
				},
				child: const Icon(Icons.add)
			),
			body: SafeArea(
				child: ListView.builder(
					itemCount: _pastGas.length,
					itemBuilder: (context, index) {
						return GasItemCard(_pastGas[index] as GasItem);
					},
				),
			),
		);
	}

	Future getPastGasList() async {
		final userEmail = FirebaseAuth.instance.currentUser?.email;
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(userEmail) // replace with userEmail
			.collection("cars")
			.doc(sellNick)
			.collection("gas")
			.orderBy("timestamp", descending: true)
			.get();

		setState(() {
			_pastGas = List.from(data.docs.map((doc) => GasItem.fromSnapshot(doc)));
		});
	}
}
