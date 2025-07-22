import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  List<EventModel> eventsList = [];
  List<EventModel> filterEventList = [];
  List<EventModel> favoriteEventList = [];
  List<String> eventsNameList = [];
  List<String> eventImagePathList = [];
  int selectedIndex = 0;

  List<String> getImagePathList(BuildContext context) {
    return eventImagePathList = [
      AppAssets.sportImage,
      AppAssets.birthdayImage,
      AppAssets.meetingImage,
      AppAssets.gamingImage,
      AppAssets.workShopImage,
      AppAssets.bookClubImage,
      AppAssets.exhibtionImage,
      AppAssets.holidaydayImage,
      AppAssets.eatingImage,
    ];
  }

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

    //todo: Bug fix: events are not filtered after changing the app language.
    // create eventImagePathList and compare it with eventImage in where method (instead of eventName).

    filterEventList =
        eventsList
            .where((event) => event.eventImage == eventImagePathList[selectedIndex - 1])
            .toList();

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

  void updateListFavorite(EventModel eventModel, BuildContext context) {
    FirebaseUtils.getEventCollection()
        .doc(eventModel.id)
        .update({'is_favorite': !eventModel.isFavorite})
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            ToastUtils.toastMsg(
              msg: AppLocalizations.of(context)!.event_updated_successfully,
              backGroundColor: AppColors.greenColor,
              textColor: AppColors.blackColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    getAllFavoriteEvents();
    notifyListeners();
  }

  void getAllFavoriteEvents() async {
    var querySnapshot = await FirebaseUtils.getEventCollection().get();

    favoriteEventList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();

    favoriteEventList =
        favoriteEventList.where((event) {
          return event.isFavorite == true;
        }).toList();

    notifyListeners();
  }

  void getAllFavoriteEventListFromFireStore() async {
    var querySnapshot =
        await FirebaseUtils.getEventCollection()
            .orderBy('event_date_time')
            .where('is_favorite', isEqualTo: true)
            .get();
    favoriteEventList =
        querySnapshot.docs.map((event) {
          return event.data();
        }).toList();
    notifyListeners();
  }
}
