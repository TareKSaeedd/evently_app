import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.028, horizontal: width * 0.04),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child:
                themeProvider.appTheme == ThemeMode.dark
                    ? getSelectedTheme(textTheme: AppLocalizations.of(context)!.dark)
                    : getUnSelectedTheme(textTheme: AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child:
                themeProvider.appTheme == ThemeMode.light
                    ? getSelectedTheme(textTheme: AppLocalizations.of(context)!.light)
                    : getUnSelectedTheme(textTheme: AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedTheme({required String textTheme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textTheme, style: AppStyles.bold20Primary),
        Spacer(),
        Icon(Icons.check, color: AppColors.primaryLight),
      ],
    );
  }

  Widget getUnSelectedTheme({required String textTheme}) {
    return Row(children: [Text(textTheme, style: AppStyles.bold20Black)]);
  }
}
