import 'package:flutter/material.dart';
import 'package:islamapp/ui/screens/home/home.dart';
import 'package:islamapp/utils/app_assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routeName = 'splash';

  @override
  State<Splash> createState() => _SplashState();

}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Image.asset(AppAssets.splash),
    );
  }
}