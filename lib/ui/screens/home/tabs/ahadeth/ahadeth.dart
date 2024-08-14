import 'dart:async';
import 'package:islamapp/ui/screens/hadeth_details/hadeth_details.dart';

import '../../../../../model/hadeth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/constants.dart';

class Ahadeth extends StatefulWidget {
  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      readHadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            AppAssets.ahadethTabLogo,
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Name',
                        style: AppStyle.titlesTextStyle,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 5,
                    thickness: 5,
                    color: AppColors.primaryColor,
                  ),
                  Expanded(child: buildAhadethList()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString(Constants.hadethFilePath);
    List<String> ahadethAsString = ahadethFileContent.split('#\r\n');
    for (int i = 0; i < ahadethAsString.length; i++) {
      String hadeth = ahadethAsString[i];
      List<String> hadethLines = hadeth.split('\n');
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadetContent = hadethLines.join();
      hadethList
          .add(Hadeth(hadethName: hadethName, hadethContent: hadetContent));
    }
    setState(() {});
  }

  Widget buildAhadethList() => hadethList.isEmpty
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: hadethList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadethDetails.routeName, arguments: hadethList[index]);
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hadethList[index].hadethName,
                    textAlign: TextAlign.center,
                    style: AppStyle.titlesTextStyle,
                  ),
                ),
              ],
            ),
          ),
        );
}
