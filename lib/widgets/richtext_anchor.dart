import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_style.dart';

class ReadRichTextWidget extends StatefulWidget {
  const ReadRichTextWidget({
    super.key,
    required this.text,
    required this.link,
  });

  final String text;
  final String link;

  @override
  State<ReadRichTextWidget> createState() => _ReadRichTextWidgetState();
}

class _ReadRichTextWidgetState extends State<ReadRichTextWidget> {
  bool showUnderLine = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text,
            style: KTextStyle.tBodyS,
          ),
          TextSpan(
            text: 'Read more',
            onEnter: (event) {
              setState(() {
                showUnderLine = true;
              });
            },
            onExit: (event) {
              setState(() {
                showUnderLine = false;
              });
            },
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final Uri url = Uri.parse(widget.link);
                launchUrl(url);
              },
            style: KTextStyle.tBodyS.copyWith(
              fontWeight: FontWeight.w700,
              color: KTextStyle.cAccent,
              decoration: showUnderLine ? TextDecoration.underline : null,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleRichText extends StatefulWidget {
  const TitleRichText({
    super.key,
    required this.text,
    this.fontSize,
    required this.link,
  });

  final String text;
  final double? fontSize;
  final String link;

  @override
  State<TitleRichText> createState() => _TitleRichTextState();
}

class _TitleRichTextState extends State<TitleRichText> {
  bool showUnderLine = false;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: widget.text,
          onEnter: (event) {
            setState(() {
              showUnderLine = true;
            });
          },
          onExit: (event) {
            setState(() {
              showUnderLine = false;
            });
          },
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              final Uri url = Uri.parse(widget.link);
              launchUrl(url);
            },
          style: KTextStyle.tTitleL.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: widget.fontSize,
            color: showUnderLine ? KTextStyle.cAccent : null,
          ),
        )
      ]),
    );
  }
}

class UnderlineRichText extends StatefulWidget {
  const UnderlineRichText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.link,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String link;
  final Color? textColor;

  @override
  State<UnderlineRichText> createState() => _UnderlineRichTextState();
}

class _UnderlineRichTextState extends State<UnderlineRichText> {
  bool showUnderLine = false;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: widget.text,
          onEnter: (event) {
            setState(() {
              showUnderLine = true;
            });
          },
          onExit: (event) {
            setState(() {
              showUnderLine = false;
            });
          },
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              final Uri url = Uri.parse(widget.link);
              launchUrl(url);
            },
          style: KTextStyle.tBodyS.copyWith(
            fontWeight: widget.fontWeight ?? FontWeight.w500,
            fontSize: widget.fontSize,
            color: showUnderLine ? KTextStyle.cWhite : widget.textColor,
            decoration: showUnderLine ? TextDecoration.underline : null,
          ),
        )
      ]),
    );
  }
}
