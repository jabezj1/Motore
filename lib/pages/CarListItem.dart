import 'package:cloud_firestore/cloud_firestore.dart';

class CarListItem {
	String? nickname;

	CarListItem();

	Map<String, dynamic> toJson() => {
		'nickname' : nickname
	};

	CarListItem.fromSnapshot(snapshot) : nickname = snapshot.data()['nickname'];
}
