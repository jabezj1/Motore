import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryItem {
	String? title;
	String? cost;
	Timestamp? timestamp;

	HistoryItem();

	Map<String, dynamic> toJson() => {
		'title': title,
		'cost': cost,
		'timestamp': timestamp
	};

	HistoryItem.fromSnapshot(snapshot):	title = snapshot.data()['title'], cost = snapshot.data()['cost'];
}