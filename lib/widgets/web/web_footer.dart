import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/footer_text.dart';

// showing the footer on main screen
class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  FooterText(title: 'About'),
                  SizedBox(width: 10),
                  FooterText(title: 'Advertising'),
                  SizedBox(width: 10),
                  FooterText(title: 'Business'),
                  SizedBox(width: 10),
                  FooterText(title: 'How Search Works'),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FooterText(title: 'Privacy'),
                SizedBox(width: 10),
                FooterText(title: 'Terms'),
                SizedBox(width: 10),
                FooterText(title: 'Settings'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
