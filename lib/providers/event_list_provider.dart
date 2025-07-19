import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  List<EventModel> eventsList = [];
  List<EventModel> filterEventList = [];
  List<String> eventsNameList = [];
  int selectedIndex = 0;

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  void getAllEvents() async {
    QuerySnapshot<EventModel> querySnapshot = await FirebaseUtils.getEventCollection().get();
    eventsList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();

    filterEventList = eventsList;
    notifyListeners();
  }

  void getFilterEvents() async {
    var quersySnapShot = await FirebaseUtils.getEventCollection().get();
    eventsList = quersySnapShot.docs.map((doc) => doc.data()).toList();

    filterEventList =
        eventsList.where((event) => event.eventName == eventsNameList[selectedIndex]).toList();

    filterEventList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void getFilterEventsFromFireStore() async {
    var querySnapShot =
        await FirebaseUtils.getEventCollection()
            .where('event_name', isEqualTo: eventsNameList[selectedIndex])
            .get();

    filterEventList = querySnapShot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }
}
