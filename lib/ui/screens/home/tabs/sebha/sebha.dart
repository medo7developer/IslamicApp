import 'package:flutter/material.dart';
import 'package:islamapp/utils/app_assets.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/utils/app_style.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  List<String> nameOfTheTasbih = [
    'subhan allah',
    'alhamdalalah',
    'la alih ala allah',
    'allah akbar'
  ];
  int tasbehCounter = 0;
  int numberOfTasbih = 0;

  double currentAngle = 0.0;


  void rotateImage() {
    setState(() {
      currentAngle += 0.03;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAssets.head_sebha_logo),
          AnimatedRotation(
            turns: currentAngle,
            duration: Duration(microseconds: 90),
            curve: Curves.easeInOutCubicEmphasized,
            child: Image.asset(AppAssets.bodySebhaLogo),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            'Number of Tasbeehs',
            style: AppStyle.titlesTextStyle,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.textColortOfSebha,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 50,
            height: 60,
            child: Center(
              child: Text('$numberOfTasbih', style: AppStyle.titlesTextStyle),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ElevatedButton(
            onPressed: () {
              rotateImage();
              tasbihChanger();
              numberOfTasbih++;
              setState(() {});
              print('numbers of sebha: $numberOfTasbih');
            },
            child: Text(
              nameOfTheTasbih[tasbehCounter],
              style: AppStyle.titlesTextStyle.copyWith(color: AppColors.white),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor)),
          ),
        ],
      ),
    );
  }

  void tasbihChanger() {
    if (numberOfTasbih >= 10) {
      numberOfTasbih = 0;
      if (tasbehCounter == 3) {
        tasbehCounter = 0;
        nameOfTheTasbih[tasbehCounter];
      } else {
        nameOfTheTasbih[tasbehCounter];
        tasbehCounter++;
      }
    }
  }
}
