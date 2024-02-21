import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color_style.dart';
import '../../../widgets/responsive.dart';
import '../../../widgets/richtext_anchor.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key, required this.onDown});

  final Function() onDown;
  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverCtrl;

  @override
  void initState() {
    _hoverCtrl = AnimationController(
      vsync: this,
      lowerBound: 46,
      upperBound: 80,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      height: 552,
      alignment: Alignment.topCenter,
      color: const Color(0xFFF3F3F3),
      child: AnimatedBuilder(
          animation: _hoverCtrl,
          builder: (context, value) {
            return SizedBox(
              height: 512 + (_hoverCtrl.value / 2),
              child: Stack(
                children: [
                  Container(
                    height: 512,
                    width: size.width,
                    color: KTextStyle.c4bGray1,
                    child: Column(
                      children: [
                        const SizedBox(height: 44),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 16 : 128),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/mail.svg'),
                                      const SizedBox(width: 12),
                                      UnderlineRichText(
                                        text: 'min1min2chit3@gmail.com',
                                        link: 'mailto:min1min2chit3@gmail.com',
                                        textColor: KTextStyle.cWhite,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/user.svg'),
                                      const SizedBox(width: 12),
                                      UnderlineRichText(
                                        text: 'View my resume',
                                        link:
                                            'https://minminchit.com/download/MMC_Portfolio_v3.1.pdf',
                                        textColor: KTextStyle.cWhite,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Connect with me',
                                    style: KTextStyle.tBodyM.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Hero(
                                    tag: 'contact',
                                    child: ContactIconRow(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: KTextStyle.cAccent,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                        ),
                        const SizedBox(height: 48),
                        AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Min Min Chit',
                              textStyle: isMobile
                                  ? KTextStyle.tTitleM.copyWith(
                                      color: KTextStyle.cWhite,
                                    )
                                  : KTextStyle.tTitleL.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                              speed: const Duration(milliseconds: 50),
                            ),
                            TypewriterAnimatedText(
                              'I\'m a Flutter Developer',
                              textStyle: isMobile
                                  ? KTextStyle.tTitleM.copyWith(
                                      color: KTextStyle.cWhite,
                                    )
                                  : KTextStyle.tTitleL.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              'Hi ! I\'m Min Min Chit',
                              textStyle: isMobile
                                  ? KTextStyle.tTitleM.copyWith(
                                      color: KTextStyle.cWhite,
                                    )
                                  : KTextStyle.tTitleL.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'I build cross-platform',
                              style: KTextStyle.tBodyL.copyWith(
                                fontWeight: FontWeight.w600,
                                color: KTextStyle.cWhite,
                              ),
                            ),
                            Text(
                              'apps with Flutter.',
                              style: KTextStyle.tBodyL.copyWith(
                                fontWeight: FontWeight.w600,
                                color: KTextStyle.cWhite,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: widget.onDown,
                      child: MouseRegion(
                        onEnter: (value) {
                          _hoverCtrl.forward();
                        },
                        onExit: (value) {
                          _hoverCtrl.reverse();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/down_arrow_circle.svg',
                          width: _hoverCtrl.value,
                          height: _hoverCtrl.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ContactIconRow extends StatefulWidget {
  const ContactIconRow({super.key});

  @override
  State<ContactIconRow> createState() => _ContactIconRowState();
}

class _ContactIconRowState extends State<ContactIconRow> {
  double githubPadding = 3;
  double linkedInPadding = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            final Uri url = Uri.parse('https://github.com/minminchit');
            launchUrl(url);
          },
          child: MouseRegion(
            onEnter: (event) {
              githubPadding = 0;
              setState(() {});
            },
            onExit: (event) {
              githubPadding = 2;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 130),
              padding: EdgeInsets.all(githubPadding),
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/icons/github.svg'),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            final Uri url = Uri.parse('www.linkedin.com/in/minminchit');
            launchUrl(url);
          },
          child: MouseRegion(
            onEnter: (event) {
              linkedInPadding = 0;
              setState(() {});
            },
            onExit: (event) {
              linkedInPadding = 2;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 130),
              padding: EdgeInsets.all(linkedInPadding),
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/icons/linkedin.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
