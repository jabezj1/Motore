import 'dart:ffi';

class GasItem {
	String? gallons;
  	int? mileage;
	String? type;
	String? cost;

	GasItem();

	Map<String, dynamic> toJson() => {
		'gallons' : gallons,
		'mileage' : mileage,
		'type' : type,
		'cost' : cost
	};

	GasItem.fromSnapshot(snapshot): 
		gallons = snapshot.data()['gallons'],
		mileage = snapshot.data()['mileage'],
		type = snapshot.data()['type'],
		cost = snapshot.data()['cost']
	;
}
