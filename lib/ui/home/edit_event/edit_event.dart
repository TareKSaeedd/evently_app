import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui/home/widgets/custom_elevated_button.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatelessWidget {
  const EditEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventListProvider = Provider.of<EventListProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    EventModel eventModelArgs = ModalRoute.of(context)?.settings.arguments as EventModel;
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        centerTitle: true,
        title: Text(
          'Event Details',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primaryLight),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: InkWell(
              onTap: () {
                // todo: call a function to edit an event
              },
              child: Image.asset(AppAssets.iconEdit),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: InkWell(
              onTap: () {
                // todo: call a function to delete an event
                eventListProvider.deleteEventFromFireStore(
                  event: eventModelArgs,
                  uId: userProvider.currentUSer!.id,
                );
                Navigator.of(context).pop();
              },
              child: Image.asset(AppAssets.iconDelete),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: height * .02, left: width * 0.04, right: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(eventModelArgs.eventImage),
            ),
            SizedBox(height: height * 0.02),
            Text(eventModelArgs.eventitle, style: AppStyles.medium24Primary),
            SizedBox(height: height * 0.02),
            CustomElevatedButton(
              backgroundColor: AppColors.whiteBgColor,
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
                      AssetImage(AppAssets.iconCalendar),
                      color:
                          themeProvider.appTheme == ThemeMode.light
                              ? AppColors.whiteColor
                              : AppColors.primaryDark,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('d MMMM yyyy').format(eventModelArgs.eventDateTime),
                        style: AppStyles.medium16Primary,
                      ),
                      Text(eventModelArgs.eventTime, style: AppStyles.medium16Black),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            CustomElevatedButton(
              backgroundColor: AppColors.whiteBgColor,
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
            Text('Description', style: AppStyles.medium16Black),
            Text(eventModelArgs.eventDescription, style: AppStyles.medium16Black),
          ],
        ),
      ),
    );
  }
}
