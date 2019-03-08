import 'package:flutter/material.dart';
import 'package:flutter_study/language/translation.dart';

/// 语言选项列表Model
class LanguageOption {

  LanguageOption({this.label,this.languageCode});

  final String label;
  final String languageCode;

}
/// 语言列表数据
List<LanguageOption> languageList = [
  LanguageOption(label: 'English',languageCode: 'en'),
  LanguageOption(label: '中文',languageCode: 'zh')
];

class LanguageSelectDemo extends StatefulWidget {
  @override
  _LanguageSelectDemoState createState() => _LanguageSelectDemoState();
}

class _LanguageSelectDemoState extends State<LanguageSelectDemo> {

  String _currentLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(Translations.of(context).text('language_select_title')),
      ),
      body: new Container(
        child: new ListView.builder(
          shrinkWrap: true,
          itemCount: languageList.length,
          itemBuilder: (BuildContext context,int index) {
            return ListTile(
              title: new Text(languageList[index].label),
              onTap: () {
                setState(() {
                  _currentLanguage = languageList[index].languageCode;
                });
                appLanguage.onLocaleChanged(Locale(_currentLanguage,));
              },
            );
          }
        ),
      )
    );
  }
}
