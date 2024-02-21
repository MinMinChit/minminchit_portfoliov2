import 'package:flutter/material.dart';
import 'package:mmc_portfoliov2/constants/color_style.dart';

import '../models/app_exp_model.dart';
import '../models/exp_skill_model.dart';
import '../models/philosophy_model.dart';
import '../models/profect_video_model.dart';

class MyConstants {
  static List<AppExpModel> appIconList = [
    AppExpModel(
      iconPath: 'AgileMe.png',
      imagePath: 'AgileMePhone.png',
      name: 'Agile Me',
      backgroundColor: const Color(0xFFE0E0E0),
      textColor: KTextStyle.cBlack,
    ),
    AppExpModel(
      iconPath: 'ForFoodie.png',
      imagePath: 'ForFoodiePhone.png',
      name: 'ForFoodie',
      backgroundColor: const Color(0xFFF55F01),
      textColor: KTextStyle.cWhite,
    ),
    AppExpModel(
      iconPath: 'Diary.png',
      imagePath: 'DiaryPhone.png',
      name: 'Diary',
      backgroundColor: const Color(0xFFFFFFFF),
      textColor: KTextStyle.cBlack,
    ),
    AppExpModel(
      iconPath: 'AgileWe.png',
      imagePath: 'AgileWePhone.png',
      name: 'Agile We',
      backgroundColor: const Color(0xFF2F80ED),
      textColor: KTextStyle.cWhite,
    ),
    AppExpModel(
        iconPath: 'DMY.png',
        imagePath: 'DMYPhone.png',
        name: 'DMY',
        backgroundColor: const Color(0xFFFEF7FF),
        textColor: KTextStyle.cBlack),
    AppExpModel(
      iconPath: 'ComingSoon.png',
      imagePath: 'ComingSoonPhone.png',
      name: 'Coming',
      backgroundColor: const Color(0xFFFFFFFF),
      textColor: KTextStyle.cBlack,
    ),
  ];

  static List<ExpSkillModel> skillList = [
    ExpSkillModel(
      title: 'Firebase Integration',
      image: 'Firebase.png',
    ),
    ExpSkillModel(
      title: 'Enabling Push Notification',
      image: 'Notification.png',
    ),
    ExpSkillModel(
      title: 'Integrating w/ Google Map APIs',
      image: 'Gmap.png',
    ),
    ExpSkillModel(
      title: 'Integrating w/ Google Cloud APIs',
      image: 'Gcloud.png',
    ),
    ExpSkillModel(
      title: 'Connect Flutter App w/ External services',
      image: 'RestAPI.png',
    ),
    ExpSkillModel(
      title: 'Effective Flutter State Management',
      image: 'Bloc.png',
    ),
    ExpSkillModel(
      title: 'Working with SQL Backend',
      image: 'SQLite.png',
    ),
    ExpSkillModel(
      title: 'Implementing Design Systems',
      image: 'Design.png',
    ),
    ExpSkillModel(
      title: 'Reusable Components',
      image: 'Dart.png',
    ),
  ];

  static List<PhilosophyModel> philosophyList = [
    PhilosophyModel(
      title: 'Clean Code & Architecture',
      content:
          'I am a true believer of clean architecture. I use feature-based architecture.',
      image: 'architecture.png',
    ),
    PhilosophyModel(
      title: 'Challenge Accepted',
      content:
          'I may not know everything. But I am motivated to learn and get things done.',
      image: 'challenge.png',
    ),
    PhilosophyModel(
      title: 'Contribute to Community',
      content:
          'I believe in open source ecosystems. I am trying my best to contribute.',
      image: 'community.png',
    ),
    PhilosophyModel(
      title: 'User-centric',
      content:
          'I do not just code. I care about the product and its usefulness for users.',
      image: 'usercentric.png',
    ),
  ];

  static List<String> otherSkillList = [
    'java.svg',
    'html.svg',
    'css.svg',
    'js.svg',
    'ts.svg',
    'python.svg',
    'c.svg',
  ];

  static List<ProjectVideoModel> projectVideoList = [
    ProjectVideoModel(
      title: 'ForFoodie • 2022',
      content:
          'Lorem ipsum dolor sit amet consectetur. Quam volutpat tellus nam viverra felis. Dui senectus nulla augue bibendum egestas amet vitae. Lacus maecenas nibh turpis neque.',
      typeList: ['Freelance', '8 Weeks', 'Product Launched'],
      videoUrl: 'https://minminchit.com/video/experience/forfoodie.mov',
      iconList: ['bell_icon.png', 'gmap_icon.png', 'firebase_icon.png'],
    ),
    ProjectVideoModel(
      title: 'Agile Me • 2022',
      content:
          'Lorem ipsum dolor sit amet consectetur. Quam volutpat tellus nam viverra felis. Dui senectus nulla augue bibendum egestas amet vitae. Lacus maecenas nibh turpis neque.',
      typeList: ['Freelance', '8 Weeks', 'Product Launched'],
      videoUrl: 'https://minminchit.com/video/experience/agile_me.mov',
      iconList: ['bell_icon.png', 'gmap_icon.png', 'firebase_icon.png'],
    ),
    ProjectVideoModel(
      title: 'Diary App • 2021',
      content:
          'Lorem ipsum dolor sit amet consectetur. Quam volutpat tellus nam viverra felis. Dui senectus nulla augue bibendum egestas amet vitae. Lacus maecenas nibh turpis neque.',
      typeList: ['Freelance', '8 Weeks', 'Product Launched'],
      videoUrl: 'https://minminchit.com/video/experience/diary_app.mov',
      iconList: ['bell_icon.png', 'gmap_icon.png', 'firebase_icon.png'],
    ),
  ];
}
