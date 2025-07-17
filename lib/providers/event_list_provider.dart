import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventListProvider extends ChangeNotifier {
  List<EventModel> eventsList = [];

  void getAllEvents() async {
    QuerySnapshot<EventModel> querySnapshot = await FirebaseUtils.getEventCollection().get();
    eventsList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
    notifyListeners();
  }
}
