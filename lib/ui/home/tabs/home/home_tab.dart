import 'package:evently_app/ui/home/tabs/home/widgets/app_bar_tabs.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/event_card.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      AppLocalizations.of(context)!.all,
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        toolbarHeight: height * 0.1,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.welcome_back, style: AppStyles.bold14Regular),
                Text("Route Academy", style: AppStyles.bold24White),
              ],
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(AppAssets.iconSun),
                    color: AppColors.whiteColor,
                    size: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('EN', style: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.1,
            padding: EdgeInsets.only(left: width * .03, top: .01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ImageIcon(AssetImage(AppAssets.iconMap), color: AppColors.whiteColor),
                    Text('Cairo , Egypt', style: AppStyles.bold14Medium),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: width * 0.025, bottom: height * 0.01),
                        child: AppBarTabs(
                          event: tabs[index],
                          index: index,
                          selectedIndex: selectedIndex,
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                        ),
                      );
                    },
                    itemCount: tabs.length,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemBuilder: (context, index) {
                return EventCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
