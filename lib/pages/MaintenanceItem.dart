class MaintenanceItem {
	String? system;
  	String? miles;

	MaintenanceItem();

	Map<String, dynamic> toJson() => {
		'system' : system,
		'miles' : miles
	};

	MaintenanceItem.fromSnapshot(snapshot): 
		system = snapshot.data()['system'],
		miles = snapshot.data()['miles']
	;
}
