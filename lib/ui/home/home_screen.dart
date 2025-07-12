import 'package:evently_app/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/ui/home/tabs/home/home_tab.dart';
import 'package:evently_app/ui/home/tabs/map/map_tab.dart';
import 'package:evently_app/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          builtBottomNavigationBarItem(
            index: 0,
            selectedIcon: AppAssets.iconHomeSelected,
            unselectedIcon: AppAssets.iconHome,
            label: AppLocalizations.of(context)!.home,
          ),
          builtBottomNavigationBarItem(
            index: 1,
            selectedIcon: AppAssets.iconMapSelected,
            unselectedIcon: AppAssets.iconMap,
            label: AppLocalizations.of(context)!.map,
          ),
          builtBottomNavigationBarItem(
            index: 2,
            selectedIcon: AppAssets.iconFavoriteSelected,
            unselectedIcon: AppAssets.iconFavorite,
            label: AppLocalizations.of(context)!.favorites,
          ),
          builtBottomNavigationBarItem(
            index: 3,
            selectedIcon: AppAssets.iconProfileSelected,
            unselectedIcon: AppAssets.iconProfile,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addEvent);
        },
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 35),
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required int index,
    required String unselectedIcon,
    required String selectedIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(selectedIndex == index ? selectedIcon : unselectedIcon)),
      label: label,
    );
  }
}
