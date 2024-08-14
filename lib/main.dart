import 'package:flutter/material.dart';
import 'package:islamapp/providers/language_provider.dart';
import 'package:islamapp/providers/theme_provider.dart';
import 'package:islamapp/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamapp/ui/screens/home/home.dart';
import 'package:islamapp/ui/screens/home/tabs/settings/settings.dart';
import 'package:islamapp/ui/screens/splash/splash.dart';
import 'package:islamapp/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamapp/utils/app_style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
        child: MyApp()
    )
  )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);

    return MaterialApp(
      theme: AppStyle.lightTheme,
      darkTheme: ThemeData(),
      themeMode: themeProvider.currentTheme,

      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(languageProvider.locale),
      routes: {
        Splash.routeName: (_) => Splash(),
        Home.routeName: (_) => Home(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
        Settings.routeName: (_) => Settings(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
