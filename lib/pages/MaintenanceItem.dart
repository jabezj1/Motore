import 'package:cloud_firestore/cloud_firestore.dart';

class MaintenanceItem {
	String? system;
  	int? miles;

	MaintenanceItem();

	Map<String, dynamic> toJson() => {
		'system' : system,
		'miles' : miles
	};

	MaintenanceItem.fromSnapshot(snapshot)
		: system = snapshot.data()['system'],
		miles = snapshot.data()['miles']
	;
}
