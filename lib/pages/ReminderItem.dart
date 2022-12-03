class ReminderItem {
	String? title;
	int? days;
	DateTime? created;

	ReminderItem();

	Map<String, dynamic> toJson() => {
		'title': title,
		'days': days,
		'timestamp': created
	};

	ReminderItem.fromSnapshot(snapshot)
		: title = snapshot.data() ['title'],
		days = snapshot.data() ['days'],
		created = snapshot.data() ['timestamp'].toDate()
	;

}