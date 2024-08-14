import 'package:flutter/material.dart';
import 'package:islamapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../utils/app_style.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold(
      {super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(themeProvider.mainBackground))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.appBarTitle ?? '',
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
        ),
        body: widget.body,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}