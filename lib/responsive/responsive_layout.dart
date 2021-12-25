import 'package:flutter/material.dart';
import 'package:google_clone/responsive/mobile_screen_layout.dart';
import 'package:google_clone/responsive/web_screen_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth <= 767) {
          return const MobileScreenLayout();
        }
        return const WebScreenLayout();
      },
    );
  }
}