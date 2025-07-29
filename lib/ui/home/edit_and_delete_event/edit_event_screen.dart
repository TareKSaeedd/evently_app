import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui/home/add_event/widgets/event_data_and_time.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/events_category.dart';
import 'package:evently_app/ui/home/widgets/custom_elevated_button.dart';
import 'package:evently_app/ui/home/widgets/custom_text_form_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  int selectedIndex = 0;
  TextEditingController evenTitletController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formatedDate = '';
  String formatedTime = '';
  String selectedEventImage = '';
  String selectedEventName = '';
  bool isSelectedDate = true;
  bool isSelectedTime = true;
  late var eventsListProvider = Provider.of<EventListProvider>(context, listen: false);
  late var userProvider = Provider.of<UserProvider>(context, listen: false);
  late EventModel eventModelArgs;
  @override
  Widget build(BuildContext context) {
    List<String> eventNamesList = [
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

    List<String> eventImagesList = [
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

    selectedEventName = eventNamesList[selectedIndex];
    selectedEventImage = eventImagesList[selectedIndex];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventModelArgs = ModalRoute.of(context)?.settings.arguments as EventModel;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor:
            themeProvider.appTheme == ThemeMode.light
                ? AppColors.whiteBgColor
                : AppColors.primaryDark,
        title: Text(
          AppLocalizations.of(context)!.edit_event,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primaryLight),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.02,
          bottom: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(eventImagesList[selectedIndex]),
              ),
              SizedBox(height: height * .02),
              SizedBox(
                height: height * 0.04,
                width: width * 033,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: width * 0.02, bottom: height * 0.01),
                      child: EventsCategory(
                        isCreateEvent: true,
                        eventName: eventNamesList[index],
                        index: index,
                        selectedIndex: selectedIndex,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                      ),
                    );
                  },
                  itemCount: eventNamesList.length,
                ),
              ),
              SizedBox(height: height * 0.02),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      controller: evenTitletController,
                      prefixIcon: Image.asset(
                        AppAssets.iconEvent,
                        color:
                            themeProvider.appTheme == ThemeMode.dark
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                      ),
                      hintText: AppLocalizations.of(context)!.event_title,
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      colorBorderSide:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_the_title_of_the_event;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      controller: descriptionController,
                      hintText: AppLocalizations.of(context)!.event_description,
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 5,
                      colorBorderSide:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.please_enter_the_description_of_the_event;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              EventDataOrTime(
                onTap: () {
                  chooseData();
                },
                chooseDateOrTimeTextStyle:
                    themeProvider.appTheme == ThemeMode.dark
                        ? AppStyles.medium16White
                        : AppStyles.medium16Black,
                imagePath: AppAssets.iconCalendar,
                dateOrTime: AppLocalizations.of(context)!.event_date,
                isSelectedDate: isSelectedDate,
                validationDateOrTimeText: AppLocalizations.of(context)!.please_enter_the_event_date,
                chooseDateOrTime:
                    selectedDate == null ? AppLocalizations.of(context)!.choose_date : formatedDate,
              ),
              SizedBox(height: height * .02),
              EventDataOrTime(
                onTap: () {
                  chooseTime();
                },
                chooseDateOrTimeTextStyle:
                    themeProvider.appTheme == ThemeMode.dark
                        ? AppStyles.medium16White
                        : AppStyles.medium16Black,
                imagePath: AppAssets.iconTime,
                dateOrTime: AppLocalizations.of(context)!.event_time,
                isSelectedTime: isSelectedTime,
                validationDateOrTimeText: AppLocalizations.of(context)!.please_enter_the_event_time,
                chooseDateOrTime:
                    selectedTime == null ? AppLocalizations.of(context)!.choose_time : formatedTime,
              ),
              SizedBox(height: height * .02),
              Text(
                AppLocalizations.of(context)!.location,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * .01),
              CustomElevatedButton(
                backgroundColor:
                    themeProvider.appTheme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.whiteColor,
                borderSideColor: AppColors.primaryLight,
                onPressed: () {},
                buttonContent: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                      width: width * 0.1,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight,
                      ),
                      child: ImageIcon(
                        AssetImage(AppAssets.iconLocation),
                        color:
                            themeProvider.appTheme == ThemeMode.light
                                ? AppColors.whiteColor
                                : AppColors.primaryDark,
                      ),
                    ),
                    Text('Cairo , Egypt', style: AppStyles.medium16Primary),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                onPressed: () {
                  if (selectedDate == null) {
                    // todo: show visible text to select date
                    isSelectedDate = false;
                  }
                  if (selectedTime == null) {
                    // todo: show visible text to select time
                    isSelectedTime = false;
                  }
                  setState(() {});
                  updateEvent();
                },
                buttonContent: Text(
                  AppLocalizations.of(context)!.update_event,
                  style: AppStyles.medium20White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseData() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    if (selectedDate != null) {
      formatedDate = DateFormat('yMMMMd').format(selectedDate!);
      isSelectedDate = true;
      setState(() {});
    }
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    selectedTime = chooseTime;

    if (selectedTime != null) {
      if (!mounted) return;
      formatedTime = selectedTime!.format(context);
      isSelectedTime = true;
      setState(() {});
    }
  }

  void updateEvent() {
    if (formKey.currentState!.validate() == true) {
      if (selectedDate == null || selectedTime == null) {
        return;
      }
      // todo: update event to firestore
      EventModel updatedModel = EventModel(
        id: eventModelArgs.id,
        eventImage: selectedEventImage,
        eventName: selectedEventName,
        eventitle: evenTitletController.text,
        eventDescription: descriptionController.text,
        eventDateTime: selectedDate!,
        eventTime: formatedTime,
      );
      eventsListProvider.updateEventFromFireStore(
        updatedModel,
        context,
        userProvider.currentUSer!.id,
      );
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRouteName, (route) => false);
    }
  }
}
