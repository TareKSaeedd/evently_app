import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.028, horizontal: width * 0.04),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child:
                languageProvider.languaege == 'en'
                    ? getSelectedLanguage(textLanguage: AppLocalizations.of(context)!.english)
                    : getUnSelectedLanguage(textLanguage: AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child:
                languageProvider.languaege == 'ar'
                    ? getSelectedLanguage(textLanguage: AppLocalizations.of(context)!.arabic)
                    : getUnSelectedLanguage(textLanguage: AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage({required String textLanguage}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textLanguage, style: AppStyles.bold20Primary),
        Spacer(),
        Icon(Icons.check, color: AppColors.primaryLight),
      ],
    );
  }

  Widget getUnSelectedLanguage({required String textLanguage}) {
    return Row(children: [Text(textLanguage, style: AppStyles.bold20Black)]);
  }
}
