import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';

class FirebaseUtils {
  static const collectionName = 'Event';

  static CollectionReference<EventModel> getEventCollection() {
    // collection with converter

    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) => EventModel.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> collectionRef = getEventCollection();
    DocumentReference<EventModel> documentRef = collectionRef.doc();
    event.id = documentRef.id;
    return documentRef.set(event);
  }
}
