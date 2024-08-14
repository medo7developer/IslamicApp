import 'package:flutter/material.dart';
import 'package:islamapp/model/sura_details_args.dart';
import 'package:islamapp/ui/screens/sura_details/sura_details.dart';
import 'package:islamapp/utils/app_assets.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/utils/constants.dart';

import '../../../../../utils/app_style.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            AppAssets.quranTabLogo,
          ),
        ),


        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Name', style: AppStyle.titlesTextStyle, textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        child: Text(
                            'Verses', style: AppStyle.titlesTextStyle, textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(height: 5, thickness: 5, color: AppColors.primaryColor,),
                  Expanded(child: buildSuraList()),
                ],
              ),
              VerticalDivider(color: AppColors.primaryColor, thickness: 5, )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSuraList() => ListView.builder(
      itemCount: Constants.suraNames.length,
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          Navigator.pushNamed(context, SuraDetails.routeName,
          arguments: SuraDetailsArgms(
              suraName: Constants.suraNames[index], fileName: '${index + 1}.txt'),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                Constants.suraNames[index],textAlign: TextAlign.center,
                style: AppStyle.titlesTextStyle,
              ),
            ),

            Expanded(
              child: Text(
                style: AppStyle.titlesTextStyle,
                  Constants.versesNumber[index].toString(),textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
  );
}
