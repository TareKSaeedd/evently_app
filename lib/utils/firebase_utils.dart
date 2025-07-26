import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';

class FirebaseUtils {
  static CollectionReference<EventModel> getEventCollection(String uId) {
    // collection with converter

    return getUserCollection()
        .doc(uId)
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) => EventModel.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(EventModel event, String uId) {
    CollectionReference<EventModel> collectionRef = getEventCollection(uId);
    DocumentReference<EventModel> documentRef = collectionRef.doc();
    event.id = documentRef.id;
    return documentRef.set(event);
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) => UserModel.fromFireStore(snapshot.data()!),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addUserToFireStore(UserModel user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> readUserFromFireStore(String id) async {
    var querySnapshot = await getUserCollection().doc(id).get();
    return querySnapshot.data();
  }
}
