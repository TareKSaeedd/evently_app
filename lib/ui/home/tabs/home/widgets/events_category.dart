import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsCategory extends StatelessWidget {
  const EventsCategory({
    super.key,
    required this.eventName,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
    this.isCreateEvent = false,
  });
  final String eventName;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  final bool isCreateEvent;

  bool get isSelected => index == selectedIndex;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isLightTheme = themeProvider.appTheme == ThemeMode.light;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: width * 0.02),
        alignment: Alignment.center,
        height: height * 0.047,
        width: width * 0.21,
        decoration: BoxDecoration(
          border: Border.all(color: _borderColor(isLightTheme)),
          color: _backgroundColor(isLightTheme),
          borderRadius: BorderRadius.circular(46),
        ),
        child: Text(eventName, style: _textStyle(isLightTheme), textAlign: TextAlign.center),
      ),
    );
  }

  // Helpers to make logic more readable
  Color _borderColor(bool isLightTheme) {
    if (isCreateEvent) {
      return AppColors.primaryLight;
    } else {
      return isLightTheme ? AppColors.whiteColor : AppColors.primaryLight;
    }
  }

  Color _backgroundColor(bool isLightTheme) {
    if (isCreateEvent) {
      if (isLightTheme) {
        return isSelected ? AppColors.primaryLight : AppColors.whiteBgColor;
      } else {
        return isSelected ? AppColors.primaryLight : AppColors.primaryDark;
      }
    } else {
      if (isLightTheme) {
        return isSelected ? AppColors.whiteBgColor : AppColors.primaryLight;
      } else {
        return isSelected ? AppColors.primaryLight : AppColors.primaryDark;
      }
    }
  }

  TextStyle _textStyle(bool isLightTheme) {
    if (isCreateEvent) {
      if (isLightTheme) {
        return isSelected ? AppStyles.medium14White : AppStyles.medium14Primary;
      } else {
        return isSelected ? AppStyles.medium14PrimaryDark : AppStyles.medium14Primary;
      }
    } else {
      if (isLightTheme) {
        return isSelected ? AppStyles.medium14Primary : AppStyles.medium14White;
      } else {
        return AppStyles.medium14White;
      }
    }
  }
}
