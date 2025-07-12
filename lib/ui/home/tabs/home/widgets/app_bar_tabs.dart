import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarTabs extends StatelessWidget {
  AppBarTabs({
    super.key,
    required this.event,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
  });
  String event;
  int index;
  int selectedIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: width * 0.02),
        alignment: Alignment.center,
        height: height * 0.047,
        width: width * 0.21,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor, width: 1.5),
          color: index == selectedIndex ? AppColors.primaryLight : AppColors.primaryDark,
          borderRadius: BorderRadius.circular(46),
        ),
        child: Text(event, style: AppStyles.medium16White),
      ),
    );
  }
}
