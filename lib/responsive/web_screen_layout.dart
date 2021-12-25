import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/web/web_search.dart';
import 'package:google_clone/widgets/translation_buttons.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';
import 'package:google_clone/widgets/web/web_footer.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Gmail',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Images',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
                icon: SvgPicture.asset('assets/images/more-apps.svg',
                    color: primaryColor),
                onPressed: () {}),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10,),
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xff1A73EB),
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // since children of column are not supposed to be 'spaced between'
                    Column(
                      children: const [
                        Search(),
                        SizedBox(height: 20),
                        SearchButtons(),
                        SizedBox(height: 20),
                        TranslationButtons(),
                      ],
                    ),
                    const WebFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
