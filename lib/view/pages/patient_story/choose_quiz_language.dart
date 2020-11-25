import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/quiz_page.dart';
import 'package:yourhealth/view/widgets/header.dart';
import 'package:yourhealth/view/widgets/user_avatar.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  List<String> _languages = ['Bangla', 'English'];
  String _language = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Language'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const Spacer(),
            //Header(),
            Image.asset(
              'assets/images/banglacovid.png',
              height: 400,
              width: 500,

            ),
            const SizedBox(height: 40),
            //UserAvatar(),
            const SizedBox(height: 30),
            Text('Choose a language'),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  //value: _value,
                  validator: (value) => value == null
                      ? 'Please select your preferred language'
                      : null,
                  hint: Text('Language'),
                  value: _language == '' ? null : _language,
                  items: _languages.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _language = value);
                    //print(_speciality);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(
                                  language: _language,
                                )));
                  },
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
