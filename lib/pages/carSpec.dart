import 'package:cloud_firestore/cloud_firestore.dart';

class CarSpec {
  String? nickname;
  String? year;
  String? make;
  String? model;
  String? trim;
  String? miles;

  CarSpec();

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'year': year,
        'make': make,
        'model': model,
        'trim': trim,
        'miles': miles
      };

  CarSpec.fromSnapshot(snapshot)
      : nickname = snapshot.data()['nickname'],
        year = snapshot.data()['year'],
        make = snapshot.data()['make'],
        model = snapshot.data()['model'],
        trim = snapshot.data()['trim'],
        miles = snapshot.data()['miles'];
}
