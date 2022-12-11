import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryItem {
  String? title;
  String? cost;
  Timestamp? timestamp;
  String? notes;
  String? location;
  String? date;

  HistoryItem();

  Map<String, dynamic> toJson() => {
        'title': title,
        'cost': cost,
        'timestamp': timestamp?.toDate().toString(),
        'notes': notes,
        'location': location,
      };

  HistoryItem.fromSnapshot(snapshot)
      : title = snapshot.data()['title'],
        timestamp = snapshot.data()['timestamp'],
        cost = snapshot.data()['cost'],
        notes = snapshot.data()['notes'],
        location = snapshot.data()['location'];
}
