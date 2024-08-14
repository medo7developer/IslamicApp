import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamapp/model/hadeth.dart';
import 'package:islamapp/model/sura_details_args.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/utils/app_style.dart';
import 'package:islamapp/widgets/app_scaffold.dart';

class HadethDetails extends StatefulWidget {
  HadethDetails({super.key});

  static const routeName = 'hadet_details';

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  late SuraDetailsArgms args;


  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return AppScaffold(
        appBarTitle: hadeth.hadethName,
        body: buildHadethContent(hadeth.hadethContent)
    );
  }


  Widget buildHadethContent(String content) => Center(
    child: Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.width * .8,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Text(content, textDirection: TextDirection.rtl, textAlign: TextAlign.center,
            style: AppStyle.titlesTextStyle.copyWith(fontSize: 16),),
        )
    ),
  );

}