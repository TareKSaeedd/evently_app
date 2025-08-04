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
  String? loadedUserId;

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

  void getAllEvents(String uId) async {
    QuerySnapshot<EventModel> querySnapshot = await FirebaseUtils.getEventCollection(uId).get();
    eventsList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();

    filterEventList = eventsList;
    loadedUserId = uId;
    notifyListeners();
  }

  void getFilterEvents(String uId) async {
    var quersySnapShot = await FirebaseUtils.getEventCollection(uId).get();
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

  void getFilterEventsFromFireStore(String uId) async {
    var querySnapShot =
        await FirebaseUtils.getEventCollection(uId)
            .orderBy('event_date_time')
            .where('event_name', isEqualTo: eventsNameList[selectedIndex])
            .get();

    filterEventList = querySnapShot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex, String uId) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents(uId) : getFilterEvents(uId);
  }

  void updateEventFromFireStore(EventModel eventModel, BuildContext context, String uId) async {
    final updatedMsg = AppLocalizations.of(context)!.event_updated_successfully;
    await FirebaseUtils.getEventCollection(uId)
        .doc(eventModel.id)
        .update({
          'event_image': eventModel.eventImage,
          'event_name': eventModel.eventName,
          'event_title': eventModel.eventitle,
          'event_description': eventModel.eventDescription,
          'event_time': eventModel.eventTime,
          'event_date_time': eventModel.eventDateTime,
        })
        .then((value) {
          getAllEvents(uId);
          ToastUtils.toastMsg(
            msg: updatedMsg,
            backGroundColor: AppColors.greenColor,
            textColor: AppColors.blackColor,
          );
        });

    notifyListeners();
  }

  void updateListFavorite(EventModel eventModel, BuildContext context, String uId) {
    final updatedMsg = AppLocalizations.of(context)!.event_updated_successfully;
    FirebaseUtils.getEventCollection(uId)
        .doc(eventModel.id)
        .update({'is_favorite': !eventModel.isFavorite})
        // todo: using .then method because we are working online
        .then((value) {
          ToastUtils.toastMsg(
            msg: updatedMsg,
            backGroundColor: AppColors.greenColor,
            textColor: AppColors.blackColor,
          );
          selectedIndex == 0 ? getAllEvents(uId) : getFilterEvents(uId);
          getAllFavoriteEventListFromFireStore(uId);
        })
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            ToastUtils.toastMsg(
              msg: updatedMsg,
              backGroundColor: AppColors.greenColor,
              textColor: AppColors.blackColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents(uId) : getFilterEvents(uId);
    getAllFavoriteEventListFromFireStore(uId);
    notifyListeners();
  }

  void getAllFavoriteEvents(String uId) async {
    var querySnapshot = await FirebaseUtils.getEventCollection(uId).get();

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

  void getAllFavoriteEventListFromFireStore(String uId) async {
    var querySnapshot =
        await FirebaseUtils.getEventCollection(
          uId,
        ).orderBy('event_date_time').where('is_favorite', isEqualTo: true).get();
    favoriteEventList =
        querySnapshot.docs.map((event) {
          return event.data();
        }).toList();
    notifyListeners();
  }

  void deleteEventFromFireStore({required String uId, required EventModel event}) async {
    await FirebaseUtils.getEventCollection(uId).doc(event.id).delete().then((value) {
      ToastUtils.toastMsg(
        msg: 'Event deleted successfully!',
        backGroundColor: AppColors.greenColor,
        textColor: AppColors.blackColor,
      );
    });
    getAllEvents(uId);
  }
}
