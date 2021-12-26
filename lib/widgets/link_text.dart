import 'package:flutter/material.dart';
// displays the title and link of the search results
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