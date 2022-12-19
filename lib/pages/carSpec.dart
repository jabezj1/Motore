// carSpec.dart

// Defines a "CarSpec" object that reads car information from a snapshot (read from the database).
// This data is used in carSpecCard where it is displayed when the user is looking at their 
// list of cars.

import 'package:cloud_firestore/cloud_firestore.dart';

class CarSpec {
  String? nickname;
  String? year;
  String? make;
  String? model;
  String? trim;
  int? miles;

  CarSpec();

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'year': year,
        'make': make,
        'model': model,
        'trim': trim,
        'miles': miles
      };

  CarSpec.fromSnapshot(snapshot): 
        nickname = snapshot.data()['nickname'],
        year = snapshot.data()['year'],
        make = snapshot.data()['make'],
        model = snapshot.data()['model'],
        trim = snapshot.data()['trim'],
        miles = snapshot.data()['miles'];
}
