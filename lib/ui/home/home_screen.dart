import 'package:evently_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BuiltBottomNavigationBarItem(
            iconName: AppAssets.homeIcon,
            label: AppLocalizations.of(context)!.home,
          ),
          BuiltBottomNavigationBarItem(
            iconName: AppAssets.mapIcon,
            label: AppLocalizations.of(context)!.map,
          ),
          BuiltBottomNavigationBarItem(
            iconName: AppAssets.favoriteIcon,
            label: AppLocalizations.of(context)!.favorites,
          ),
          BuiltBottomNavigationBarItem(
            iconName: AppAssets.profileIcon,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem BuiltBottomNavigationBarItem({
  required String iconName,
  required String label,
}) {
  return BottomNavigationBarItem(icon: ImageIcon(AssetImage(iconName)), label: label);
}
