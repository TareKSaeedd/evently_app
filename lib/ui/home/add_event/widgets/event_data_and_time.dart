import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDataAndTime extends StatelessWidget {
  EventDataAndTime({
    super.key,
    required this.imagePath,
    required this.dateOrTime,
    required this.chooseDateOrTime,
    this.dateOrTimeTextStyle,
    this.chooseDateOrTimeTextStyle,
    required this.onTap,
  });

  String imagePath;
  String dateOrTime;
  String chooseDateOrTime;
  TextStyle? dateOrTimeTextStyle;
  TextStyle? chooseDateOrTimeTextStyle;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Row(
      children: [
        ImageIcon(
          AssetImage(imagePath),
          color:
              themeProvider.appTheme == ThemeMode.dark
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
        ),
        SizedBox(width: width * 0.03),
        Text(dateOrTime, style: chooseDateOrTimeTextStyle),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            chooseDateOrTime,
            style: chooseDateOrTimeTextStyle ?? AppStyles.medium16Primary,
          ),
        ),
      ],
    );
  }
}
