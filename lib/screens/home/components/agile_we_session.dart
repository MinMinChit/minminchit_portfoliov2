import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color_style.dart';

class AgileWeSession extends StatelessWidget {
  const AgileWeSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 780,
      margin: const EdgeInsets.only(bottom: 100),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            KTextStyle.cWhite,
            const Color(0xFFEAF2FD),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/agilewe_section.png')),
          Column(
            children: [
              const Row(),
              const SizedBox(height: 90),
              Text(
                'In partnership with a designer, my own app released.',
                style: KTextStyle.tBodyM,
              ),
              const SizedBox(height: 12),
              Text(
                'Agile We - Personal Goal Management App',
                style: KTextStyle.tTitleM,
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: KTextStyle.cAccent)),
                  ),
                  onPressed: () {
                    final Uri url =
                        Uri.parse('https://agilewe.spacematterapps.com/');
                    launchUrl(url);
                  },
                  child: Text(
                    'Learn more',
                    style: KTextStyle.tBodyS.copyWith(
                      fontWeight: FontWeight.w700,
                      color: KTextStyle.cAccent,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
