import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/event_card.dart';
import 'package:evently_app/ui/home/widgets/custom_text_form_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  TextEditingController searchController = TextEditingController();
  late EventListProvider eventListProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventListProvider.getAllFavoriteEvents(userProvider.currentUSer!.id);
      // eventListProvider.getAllFavoriteEventListFromFireStore();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: CustomTextFormField(
              hintText: AppLocalizations.of(context)!.search_for_events,
              hintStyle: AppStyles.bold14Primary,
              colorBorderSide: AppColors.primaryLight,
              cursorColor: AppColors.primaryLight,
              prefixIcon: Image.asset(AppAssets.iconSearch),
              controller: searchController,
            ),
          ),
          Expanded(
            child:
                eventListProvider.favoriteEventList.isEmpty
                    ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_events_added_to_favorites_yet,
                        style: AppStyles.semi20Black,
                      ),
                    )
                    : ListView.separated(
                      padding: EdgeInsets.only(top: height * 0.02),
                      itemBuilder: (context, index) {
                        return EventCard(eventModel: eventListProvider.favoriteEventList[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemCount: eventListProvider.favoriteEventList.length,
                    ),
          ),
        ],
      ),
    );
  }
}
