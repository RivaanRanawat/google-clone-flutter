import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

// text to show the translation buttons like hindi etc etc
class LanguageText extends StatelessWidget {
  final String title;
  const LanguageText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: blueColor,
        ),
      ),
    );
  }
}
