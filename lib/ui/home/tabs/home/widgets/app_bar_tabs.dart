import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: width * 0.02),
        alignment: Alignment.center,
        height: height * 0.047,
        width: width * 0.21,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor, width: 1.5),
          color:
              index == selectedIndex
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(46),
        ),
        child: Text(
          event,
          style:
              index == selectedIndex
                  ? Theme.of(context).textTheme.headlineMedium
                  : Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
