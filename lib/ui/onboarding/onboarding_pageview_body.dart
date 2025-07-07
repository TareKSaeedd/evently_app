import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPageviewBody extends StatelessWidget {
  OnboardingPageviewBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.index,
  });
  String imagePath;
  String title;
  String description;
  int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.05),
        Image.asset(imagePath),
        SizedBox(height: height * 0.046),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.bold20Primary),
              SizedBox(height: height * 0.046),
              Text(description, style: AppStyles.medium16Black),
            ],
          ),
        ),
      ],
    );
  }
}
