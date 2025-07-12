import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/onboarding/onboarding_pageview_body.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final titlesList = [
      AppLocalizations.of(context)!.onboarding_title1,
      AppLocalizations.of(context)!.onboarding_title2,
      AppLocalizations.of(context)!.onboarding_title3,
    ];

    final descriptionsList = [
      AppLocalizations.of(context)!.onboarding_description1,
      AppLocalizations.of(context)!.onboarding_description2,
      AppLocalizations.of(context)!.onboarding_description3,
    ];

    final imagePathList = [
      AppAssets.onboardingBody1,
      AppAssets.onboardingBody2,
      AppAssets.onboardingBody3,
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.appTheme == ThemeMode.light
              ? AppColors.whiteBgColor
              : AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor:
            themeProvider.appTheme == ThemeMode.light
                ? AppColors.whiteBgColor
                : AppColors.primaryDark,
        centerTitle: true,
        toolbarHeight: height * 0.11,
        title: Image.asset(AppAssets.onboardingTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                final title = titlesList[index];
                final description = descriptionsList[index];
                final imagePath = imagePathList[index];
                return OnboardingPageviewBody(
                  imagePath: imagePath,
                  title: title,
                  description: description,
                  index: index,
                );
              },
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: 3,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
              bottom: height * 0.013,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentIndex != 0,
                  child: IconButton.outlined(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    icon: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryLight, width: 2),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.only(right: width * 0.01),
                        width: i == currentIndex ? 20 : 8,
                        height: 8,
                        decoration:
                            themeProvider.appTheme == ThemeMode.light
                                ? BoxDecoration(
                                  color:
                                      i == currentIndex
                                          ? AppColors.primaryLight
                                          : AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(36),
                                )
                                : BoxDecoration(
                                  color:
                                      i == currentIndex
                                          ? AppColors.primaryLight
                                          : AppColors.whiteBgColor,
                                  borderRadius: BorderRadius.circular(36),
                                ),
                      ),
                  ],
                ),
                IconButton.outlined(
                  onPressed: () {
                    currentIndex == 2
                        ? Navigator.pushReplacementNamed(context, AppRoutes.loginScreen)
                        : pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                  },
                  icon: const Icon(Icons.arrow_forward, color: AppColors.primaryLight),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryLight, width: 2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
