import 'package:evently_app/ui/home/tabs/home/widgets/event_card.dart';
import 'package:evently_app/ui/home/widgets/custom_text_form_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
