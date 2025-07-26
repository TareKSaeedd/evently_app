import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.eventModel});
  EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventListProvider = Provider.of<EventListProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      height: height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight, width: 2),
        image: DecorationImage(image: AssetImage(eventModel.eventImage), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.001),
            margin: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  themeProvider.appTheme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.whiteColor,
            ),
            child: Column(
              children: [
                Text(eventModel.eventDateTime.day.toString(), style: AppStyles.bold20Primary),
                Text(
                  DateFormat('MMM').format(eventModel.eventDateTime),
                  style: AppStyles.bold14Primary,
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
            decoration: BoxDecoration(
              color:
                  themeProvider.appTheme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventModel.eventitle,
                  style:
                      themeProvider.appTheme == ThemeMode.dark
                          ? AppStyles.bold14White
                          : AppStyles.bold14Black,
                ),
                GestureDetector(
                  onTap: () {
                    eventListProvider.updateListFavorite(
                      eventModel,
                      context,
                      userProvider.currentUSer!.id,
                    );
                  },
                  child:
                      eventModel.isFavorite == true
                          ? Image.asset(
                            AppAssets.iconFavoriteSelected,
                            color: AppColors.primaryLight,
                          )
                          : Image.asset(AppAssets.iconFavorite, color: AppColors.primaryLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
