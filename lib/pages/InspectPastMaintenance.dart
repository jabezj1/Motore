import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/HistoryItem.dart';
import 'package:motore/pages/HistoryItemCard.dart';
import 'package:motore/pages/createGasExpense.dart';
import 'package:motore/pages/createHistoryEntry.dart';
import 'package:motore/pages/createMaintenanceHistory.dart';
import 'package:motore/services/auth.dart';
// import 'package:flutter/src/rendering/box.dart';

class InspectPastMaintenance extends StatefulWidget {
	const InspectPastMaintenance({super.key});

	@override
	State<InspectPastMaintenance> createState() => _InspectPastMaintenanceState();
}

class _InspectPastMaintenanceState extends State<InspectPastMaintenance> {
	List<Object> _pastMaintenance = [];

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getPastMaintenanceList();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		appBar: AppBar(
			automaticallyImplyLeading: true,
			title: Text(historyType),
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
				if (historyType == "Monthly Expenses") {
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) =>
							const CreateHistoryEntry(title: "title")));
				}
				if (historyType == "Gas Expenses") {
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) => CreateGasExpense(title: "title")));
				}
				if (historyType == "Maintenance History") {
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) =>
							CreateMaintenanceHistory(title: "title")));
				}
			},
			child: const Icon(Icons.add)),
		body: SafeArea(
			child: ListView.builder(
			itemCount: _pastMaintenance.length,
			itemBuilder: (context, index) {
				return HistoryItemCard(_pastMaintenance[index] as HistoryItem);
			},
			),
		),
		);
	}

	Future getPastMaintenanceList() async {
		final userEmail = FirebaseAuth.instance.currentUser?.email;
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(userEmail) // replace with userEmail
			.collection("cars")
			.doc(sellNick)
			.collection("service")
			.orderBy("timestamp", descending: true)
			.get();

		setState(() {
		_pastMaintenance =
			List.from(data.docs.map((doc) => HistoryItem.fromSnapshot(doc)));
		});
	}
}
