import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseItem {
	String? title;
  String? cost;
  Timestamp? timestamp;
	
	ExpenseItem();

	Map<String, dynamic> toJson() => {
		'title' : title,
		'cost' : cost,
    'timestamp' : timestamp?.toDate().toString()
	};

	ExpenseItem.fromSnapshot(snapshot): 
		title = snapshot.data()['title'],
		cost = snapshot.data()['cost'],
    timestamp = snapshot.data()['timestamp']
	;
}
