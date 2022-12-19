class ReminderItem {
	String? title;
	String? days;
	DateTime? created;

	ReminderItem();

	Map<String, dynamic> toJson() => {
		'title': title,
		'days': days
	};

	ReminderItem.fromSnapshot(snapshot): 
		title = snapshot.data() ['title'],
		days = snapshot.data() ['days'];

}