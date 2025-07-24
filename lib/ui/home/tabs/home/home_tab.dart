import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/events_category.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/event_card.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventsListProvider = Provider.of<EventListProvider>(context);
    eventsListProvider.getEventNameList(context);
    eventsListProvider.getImagePathList(context);
    if (eventsListProvider.eventsList.isEmpty) {
      eventsListProvider.getAllEvents();
    }
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
                        child: EventsCategory(
                          eventName: eventsListProvider.eventsNameList[index],
                          index: index,
                          selectedIndex: eventsListProvider.selectedIndex,
                          onTap: () {
                            eventsListProvider.changeSelectedIndex(index);
                          },
                        ),
                      );
                    },
                    itemCount: eventsListProvider.eventsNameList.length,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                eventsListProvider.filterEventList.isEmpty
                    ? Center(child: Text('No events added yet.', style: AppStyles.bold20Primary))
                    : ListView.separated(
                      padding: EdgeInsets.only(top: height * 0.02),
                      itemBuilder: (context, index) {
                        return EventCard(eventModel: eventsListProvider.filterEventList[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemCount: eventsListProvider.filterEventList.length,
                    ),
          ),
        ],
      ),
    );
  }
}
