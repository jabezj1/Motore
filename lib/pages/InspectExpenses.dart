import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/CreateNewExpense.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/HistoryItem.dart';
import 'package:motore/pages/HistoryItemCard.dart';
import 'package:motore/pages/createGasExpense.dart';
import 'package:motore/pages/createHistoryEntry.dart';
import 'package:motore/pages/createMaintenanceHistory.dart';
import 'package:motore/services/auth.dart';
import 'package:motore/pages/ExpenseItem.dart';
import 'package:motore/pages/ExpenseItemCard.dart';
// import 'package:flutter/src/rendering/box.dart';

class InspectExpenses extends StatefulWidget {
    const InspectExpenses({super.key});

    @override
    State<InspectExpenses> createState() => _InspectExpensesState();
}

class _InspectExpensesState extends State<InspectExpenses> {
	List<Object> _expenses = []; 

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getExpensesList();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: true,
				title: const Text("Expenses"),
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
						MaterialPageRoute(builder: (context) => const CreateNewExpense(title: "title"))
					);
				},
				child: const Icon(Icons.add)
			),
			body: SafeArea(
				child: ListView.builder(
					itemCount: _expenses.length,
					itemBuilder: (context, index) {
						return ExpenseItemCard(_expenses[index] as ExpenseItem);
					},
				),
			),
		);
	}

	Future getExpensesList() async {
		final userEmail = FirebaseAuth.instance.currentUser?.email;
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(userEmail) // replace with userEmail
			.collection("cars")
			.doc(sellNick)
			.collection("expenses")
			.orderBy("timestamp", descending: true)
			.get();

		setState(() {
			_expenses = List.from(data.docs.map((doc) => ExpenseItem.fromSnapshot(doc)));
		});
	}
}
