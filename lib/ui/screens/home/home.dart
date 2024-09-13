import 'package:flutter/material.dart';
import 'package:islamapp/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islamapp/ui/screens/home/tabs/quran/quran.dart';
import 'package:islamapp/ui/screens/home/tabs/radio/radio.dart';
import 'package:islamapp/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:islamapp/ui/screens/home/tabs/settings/settings.dart';
import 'package:islamapp/utils/app_assets.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/widgets/app_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTapIndex = 0;

  List<Widget> tabs = [Quran(), Ahadeth(), MyRadio(), Sebha(), Settings()];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: AppLocalizations.of(context)!.islami,
      body: tabs[selectedTapIndex],
      bottomNavigationBar: buildBotoomNavigation(),
    );
  }

  Theme buildBotoomNavigation() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.primaryColor),
      child: BottomNavigationBar(
        currentIndex: selectedTapIndex,
        onTap: (index) {
          selectedTapIndex = index;
          setState(() {});
        },
        selectedItemColor: AppColors.accentColor,
        selectedIconTheme: IconThemeData(size: 33),
        unselectedIconTheme: IconThemeData(size: 25),
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icQuran)),
              label: AppLocalizations.of(context)!.quran),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icHadeth)),
              label: AppLocalizations.of(context)!.ahadeth),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icRadio)),
              label: AppLocalizations.of(context)!.radio),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icSebha)),
              label: AppLocalizations.of(context)!.sebha),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings),
        ],
      ),
    );
  }

}