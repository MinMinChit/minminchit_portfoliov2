import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color_style.dart';
import '../../../widgets/responsive.dart';
import '../../../widgets/richtext_anchor.dart';

class EndSection extends StatelessWidget {
  const EndSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/big_mail.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: VerticalDivider(
                width: 1,
                color: KTextStyle.cBlack,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Got a project idea?',
                  style: KTextStyle.tTitleM,
                ),
                const SizedBox(height: 8),
                Text(
                  'I have built various flutter app for all of these platforms\n'
                  'Android • iOS • Websites • Kiosk • Tablets • Windows',
                  style: KTextStyle.tBodyM,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 64,
                  width: 283,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF1FBCFD),
                      ),
                    ),
                    onPressed: () {
                      final Uri url = Uri.parse('https://spacematterapps.com');
                      launchUrl(url);
                    },
                    child: Text(
                      'Visit Spacematter Apps',
                      style: KTextStyle.tTitleS.copyWith(
                        color: KTextStyle.cWhite,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Designed by ',
              style: isMobile
                  ? KTextStyle.tBodyS.copyWith(
                      color: KTextStyle.cBlack.withOpacity(0.6),
                    )
                  : KTextStyle.tBodyM,
            ),
            TitleRichText(
              text: 'Presto',
              link: 'https://prestokaung.com',
              fontSize: isMobile ? 15 : 18,
            ),
            Text(
              ' | Developed by ',
              style: isMobile
                  ? KTextStyle.tBodyS.copyWith(
                      color: KTextStyle.cBlack.withOpacity(0.6),
                    )
                  : KTextStyle.tBodyM,
            ),
            TitleRichText(
              text: 'MMC',
              link: 'https://minminchit.com',
              fontSize: isMobile ? 15 : 18,
            ),
          ],
        ),
        Text(
          '2024 © All rights reserved',
          style: isMobile
              ? KTextStyle.tBodyS.copyWith(
                  color: KTextStyle.cBlack.withOpacity(0.6),
                )
              : KTextStyle.tBodyM,
        ),
      ],
    );
  }
}
