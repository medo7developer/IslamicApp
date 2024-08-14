import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamapp/model/sura_details_args.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/utils/app_style.dart';
import 'package:islamapp/widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
   SuraDetails({super.key});

  static const routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgms args;

  String fileContent = '';

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgms;

    if(fileContent.isEmpty){
      readFile();
    }
    return AppScaffold(
      appBarTitle: args.suraName,
      body: fileContent.isEmpty ?
      buildLoading() :
          buildSuraContent()
    );
  }

  Center buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget buildSuraContent() => Center(
    child: Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.width * .8,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Text(fileContent, textDirection: TextDirection.rtl, textAlign: TextAlign.center,
          style: AppStyle.titlesTextStyle.copyWith(fontSize: 16),),
        )
    ),
  );

  Future readFile() async{
    fileContent = await rootBundle.loadString('assets/files/quran/${args.fileName}');
    List<String> fileLines = fileContent.split('\n');
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for(int i = 0; i < fileLines.length; i++){
        fileLines[i] += '(${i + 1})';
    }
    fileContent = fileLines.join();
    setState(() {});
    print('file Content $fileContent');
  }
}