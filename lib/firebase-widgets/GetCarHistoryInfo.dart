import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetCarHistoryInfo extends StatelessWidget {
	final String documentID;
	const GetCarHistoryInfo(this.documentID, {super.key});

	@override 
	Widget build(BuildContext context) {
		CollectionReference user = FirebaseFirestore.instance.collection("collection name here"); 
		// Figure out convention for naming collections and documents

		return FutureBuilder<DocumentSnapshot>(
			future: user.doc(documentID).get(),
			builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

				if (snapshot.hasError) {
					return const Text("Something went wrong");
				}

				if (snapshot.hasData && !snapshot.data!.exists) {
					return const Text("Document does not exist");
				}

				// 1. put the data into variables
				// 2. print variables in place of hard-coded values
				return const Text("Filler text!");
			},
		);
	}
}