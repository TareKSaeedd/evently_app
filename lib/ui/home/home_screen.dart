import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        title: Text(AppLocalizations.of(context)!.language, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
