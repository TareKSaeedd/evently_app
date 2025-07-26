class EventModel {
  String id;
  String eventImage;
  String eventName;
  String eventitle;
  String eventDescription;
  DateTime eventDateTime;
  String eventTime;
  bool isFavorite;
  static const collectionName = 'Event';

  EventModel({
    this.id = '',
    required this.eventImage,
    required this.eventName,
    required this.eventitle,
    required this.eventDescription,
    required this.eventDateTime,
    required this.eventTime,
    this.isFavorite = false,
  });

  EventModel.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        eventImage: data['event_image'],
        eventName: data['event_name'],
        eventitle: data['event_title'],
        eventDescription: data['event_description'],
        eventTime: data['event_time'],
        eventDateTime: DateTime.fromMillisecondsSinceEpoch(data['event_date_time']),
        isFavorite: data['is_favorite'],
      );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'event_image': eventImage,
      'event_name': eventName,
      'event_title': eventitle,
      'event_description': eventDescription,
      'event_time': eventTime,
      'event_date_time': eventDateTime.millisecondsSinceEpoch,
      'is_favorite': isFavorite,
    };
  }
}
