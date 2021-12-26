import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
// button to show search and im feeling lucky button
class SearchButton extends StatelessWidget {
  final String title;

  const SearchButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 18,
      ),
      color: searchColor,
      onPressed: () {},
      child: Text(
        title,
      ),
    );
  }
}
