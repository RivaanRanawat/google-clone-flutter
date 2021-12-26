import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatelessWidget {
  final String linkToGo;
  final String link;
  final String text;
  final String desc;
  const SearchResultComponent({
    Key? key,
    required this.linkToGo,
    required this.link,
    required this.text,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          link,
          // style: TextStyle(fontSize: 14, color: primaryColor,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: LinkText(
            link: link,
            text: text,
            textStyle: const TextStyle(color: blueColor,fontSize: 20,),
            onTap: () async {
              if (await canLaunch(linkToGo)) {
                await launch(linkToGo);
              }
            },
          ),
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 14, color: primaryColor,),
        ),
      ],
    );
  }
}

class LinkText extends StatefulWidget {
  final String link;
  final String text;
  final Function()? onTap;
  final TextStyle? textStyle;

  const LinkText(
      {Key? key,
      required this.link,
      required this.text,
      this.onTap,
      this.textStyle})
      : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool _showUnderLine = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      onHover: (hovering) {
        setState(() {
          _showUnderLine = hovering;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.link,
            style: const TextStyle(fontSize: 14, color: Color(0xFF202124),),
          ),
          Text(
            widget.text,
            style: widget.textStyle != null
                ? widget.textStyle?.copyWith(
                    decoration: _showUnderLine
                        ? TextDecoration.underline
                        : TextDecoration.none)
                : TextStyle(
                    color: const Color(0xFF1a0dab),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    decoration: _showUnderLine
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
          ),
        ],
      ),
    );
  }
}
