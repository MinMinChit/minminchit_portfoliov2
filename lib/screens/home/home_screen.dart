import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mmc_portfoliov2/constants/color_style.dart';
import 'package:mmc_portfoliov2/screens/home/components/end_section.dart';
import 'package:mmc_portfoliov2/widgets/richtext_anchor.dart';

import 'components/agile_we_session.dart';
import 'components/flutter_skill_session.dart';
import 'components/header_session.dart';
import 'components/other_skill_session.dart';
import 'components/philosophy_session.dart';
import 'components/show_case_session.dart';
import 'components/video_session.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey headerKey = GlobalKey();
  GlobalKey showcaseKey = GlobalKey();
  GlobalKey skillKey = GlobalKey();
  GlobalKey philosophyKey = GlobalKey();
  GlobalKey otherSkillKey = GlobalKey();
  GlobalKey videoKey = GlobalKey();
  GlobalKey agileWeKey = GlobalKey();

  TabController? tabController;
  int tabIndex = 0;

  ScrollController scrollController = ScrollController();
  bool showcaseStart = false;
  bool skillStart = false;
  bool philosophyStart = false;
  bool showNavItems = false;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);

    scrollController.addListener(() {
      double scrollPosition = scrollController.position.pixels;
      double headerHeight = headerKey.currentContext?.size?.height ?? 0;
      double showcaseHeight = showcaseKey.currentContext?.size?.height ?? 0;
      double skillHeight = skillKey.currentContext?.size?.height ?? 0;
      double philosophyHeight = philosophyKey.currentContext?.size?.height ?? 0;
      double otherSkillHeight = otherSkillKey.currentContext?.size?.height ?? 0;
      double videoHeight = videoKey.currentContext?.size?.height ?? 0;

      if (scrollPosition < 80) {
        showNavItems = false;
      } else {
        showNavItems = true;
      }
      double headerP = headerHeight;
      double experienceP = headerP + showcaseHeight;
      double skillP = experienceP + skillHeight;
      double casestudyP =
          skillP + philosophyHeight + otherSkillHeight + videoHeight;

      if (scrollPosition < experienceP) {
        tabIndex = 0;
      } else if (scrollPosition >= experienceP && scrollPosition < skillP) {
        tabIndex = 1;
      } else if (scrollPosition >= skillP) {
        tabIndex = 2;
      }
      tabController?.index = tabIndex;
      if (scrollPosition >= 160) {
        if (!showcaseStart) {
          showcaseStart = true;
        }
      }
      if (scrollPosition >= 850) {
        if (!skillStart) {
          skillStart = true;
        }
      }
      if (scrollPosition >= 1600) {
        if (!philosophyStart) {
          philosophyStart = true;
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTextStyle.cWhite,
      body: Stack(
        children: [
          ListView(
            cacheExtent: 5000,
            controller: scrollController,
            children: [
              HeaderSection(
                key: headerKey,
                onDown: () {
                  Scrollable.ensureVisible(
                    showcaseKey.currentContext!,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFF3F3F3),
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    ShowcaseSection(
                        key: showcaseKey, showcaseStart: showcaseStart),
                    FlutterSkillSection(key: skillKey, skillStart: skillStart),
                  ],
                ),
              ),
              PhilosophySession(
                  key: philosophyKey, philosophyStart: philosophyStart),
              OtherSkillSession(
                key: otherSkillKey,
              ),
              VideoSession(key: videoKey),
              AgileWeSession(key: agileWeKey),
              const SizedBox(height: 100),
              const EndSection(),
              const SizedBox(height: 180)
            ],
          ),
          showNavItems
              ? Material(
                  elevation: 2,
                  color: KTextStyle.cF5White,
                  child: Container(
                    height: 75,
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      color: KTextStyle.c4bGray1,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: KTextStyle.cAccent,
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  Text(
                                    'Min Min Chit | ',
                                    style: KTextStyle.tBodyM.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                                  ),
                                  UnderlineRichText(
                                    text: 'Email',
                                    link: 'mailto:min1min2chit3@gmail.com',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    textColor: KTextStyle.cWhite,
                                  ),
                                  Text(
                                    ' • ',
                                    style: KTextStyle.tBodyM.copyWith(
                                      color: KTextStyle.cWhite,
                                    ),
                                  ),
                                  UnderlineRichText(
                                    text: 'Resume',
                                    link:
                                        'https://minminchit.com/download/MMC_Portfolio_v3.1.pdf',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    textColor: KTextStyle.cWhite,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              labelPadding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              isScrollable: true,
                              dividerHeight: 0,
                              controller: tabController,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelColor: KTextStyle.cAccent,
                              unselectedLabelColor: KTextStyle.cWhite,
                              indicatorColor: KTextStyle.cAccent,
                              dividerColor: Colors.transparent,
                              labelStyle: KTextStyle.tTabLabel,
                              tabAlignment: TabAlignment.center,
                              onTap: (value) {
                                tabIndex = value;
                                if (tabIndex == 0) {
                                  Scrollable.ensureVisible(
                                    showcaseKey.currentContext!,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                } else if (tabIndex == 1) {
                                  Scrollable.ensureVisible(
                                    skillKey.currentContext!,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                } else if (tabIndex == 2) {
                                  Scrollable.ensureVisible(
                                    philosophyKey.currentContext!,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );

                                  setState(() {});
                                }
                              },
                              tabs: [
                                Tab(
                                  icon: SvgPicture.asset(
                                    tabIndex == 0
                                        ? 'assets/icons/experience_on.svg'
                                        : 'assets/icons/experience.svg',
                                    width: 22,
                                    height: 22,
                                  ),
                                  text: 'Experience',
                                ),
                                Tab(
                                  icon: SvgPicture.asset(
                                    tabIndex == 1
                                        ? 'assets/icons/skill_on.svg'
                                        : 'assets/icons/skill.svg',
                                    width: 22,
                                    height: 22,
                                  ),
                                  text: 'Skills',
                                ),
                                Tab(
                                  icon: SvgPicture.asset(
                                    tabIndex == 2
                                        ? 'assets/icons/casestudy_on.svg'
                                        : 'assets/icons/casestudy.svg',
                                    width: 22,
                                    height: 22,
                                  ),
                                  text: 'Casestudy',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Hero(
                            tag: 'contact',
                            child: ContactIconRow(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
