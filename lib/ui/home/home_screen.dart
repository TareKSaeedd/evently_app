import 'package:evently_app/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        ),
        backgroundColor: AppColors.primaryLight,
        title: Row(
          children: [
            Image.asset('assets/images/route_logo.png'),
            SizedBox(width: width * 0.04),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Route Academy', style: AppStyles.bold24White),
                SizedBox(height: height * 0.01),
                Text('RouteAcademy@gmail.com', style: AppStyles.bold16White),
              ],
            ),
          ],
        ),
      ),
      body: ProfileTab(),
    );
  }
}
