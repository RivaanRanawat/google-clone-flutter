import 'package:flutter/material.dart';
import 'package:google_clone/widgets/language_text.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        Text('Google offered in:'),
        SizedBox(width: 5),
        LanguageText(title: 'हिन्दी'),
        SizedBox(width: 5),
        LanguageText(title: 'বাংলা'),
        SizedBox(width: 5),
        LanguageText(title: 'తెలుగు'),
        SizedBox(width: 5),
        LanguageText(title: 'मराठी'),
        SizedBox(width: 5),
        LanguageText(title: 'தமிழ்'),
        SizedBox(width: 5),
        LanguageText(title: 'ગુજરાતી'),
        SizedBox(width: 5),
        LanguageText(title: 'ಕನ್ನಡ'),
        SizedBox(width: 5),
        LanguageText(title: 'മലയാളം'),
        SizedBox(width: 5),
        LanguageText(title: 'ਪੰਜਾਬੀ'),
      ],
    );
  }
}
