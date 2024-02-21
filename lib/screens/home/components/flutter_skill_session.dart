import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mmc_portfoliov2/models/exp_skill_model.dart';

import '../../../constants/color_style.dart';
import '../../../constants/constants.dart';

class FlutterSkillSection extends StatefulWidget {
  const FlutterSkillSection({
    super.key,
    required this.skillStart,
  });

  final bool skillStart;

  @override
  State<FlutterSkillSection> createState() => _FlutterSkillSectionState();
}

List<double> topPositionList = [54, 55, 107, 67, 110, 150, 80, 130, 180];

class _FlutterSkillSectionState extends State<FlutterSkillSection> {
  List<ExpSkillModel> skillList = MyConstants.skillList;

  @override
  Widget build(BuildContext context) {
    if (widget.skillStart && topPositionList[0] != 0) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        for (var i = 0; i < skillList.length; i++) {
          topPositionList[i] = 0;
        }
        setState(() {});
      });
    }
    return Column(
      children: [
        const SizedBox(height: 100),
        Text('Wide-range of Flutter experience and skills',
            style: KTextStyle.tTitleM),
        const SizedBox(height: 40),
        Container(
          width: 999,
          height: 402,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/table_line.png'),
            ),
          ),
          child: Wrap(
            children: List.generate(skillList.length, (index) {
              return Visibility(
                visible: widget.skillStart,
                child: AnimatedContainer(
                  padding: EdgeInsets.only(top: topPositionList[index]),
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.linearToEaseOut,
                  child: SkillCard(
                    title: skillList[index].title,
                    image: skillList[index].image,
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Firebase, Google Maps, Google Cloud, Bloc, Flutter, SQLite & ForFoodie Logo are owned by respective companies',
          style: KTextStyle.tBodyXs.copyWith(
            color: KTextStyle.c8dGray2,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  GlobalKey key = GlobalKey();

  String nearestAngle = '';

  double _calculateDistance(Offset point1, Offset point2) {
    double dx = point1.dx - point2.dx;
    double dy = point1.dy - point2.dy;
    return sqrt(dx * dx + dy * dy);
  }

  _beginAlignment(String angle) {
    if (angle == 'a') {
      return Alignment.topLeft;
    } else if (angle == 'b') {
      return Alignment.topRight;
    } else if (angle == 'c') {
      return Alignment.bottomRight;
    } else if (angle == 'd') {
      return Alignment.bottomLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        nearestAngle = '';
        setState(() {});
      },
      onHover: (event) {
        RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        double startX = position.dx;
        double startY = position.dy;
        double endX = position.dx + 333;
        double endY = position.dy + 134;

        Offset a = Offset(startX, startY);
        Offset b = Offset(endX, startY);
        Offset c = Offset(endX, endY);
        Offset d = Offset(startX, endY);
        Offset mouse = event.position;

        double distanceToA = _calculateDistance(mouse, a);
        double distanceToB = _calculateDistance(mouse, b);
        double distanceToC = _calculateDistance(mouse, c);
        double distanceToD = _calculateDistance(mouse, d);

        // Find the nearest position
        double minDistance =
            min(min(distanceToA, distanceToB), min(distanceToC, distanceToD));

        if (minDistance == distanceToA) {
          nearestAngle = 'a';
        } else if (minDistance == distanceToB) {
          nearestAngle = 'b';
        } else if (minDistance == distanceToC) {
          nearestAngle = 'c';
        } else {
          nearestAngle = 'd';
        }
        setState(() {});
      },
      child: Container(
        key: key,
        height: 134,
        width: 333,
        decoration: BoxDecoration(
          gradient: nearestAngle.isNotEmpty
              ? LinearGradient(
                  begin: _beginAlignment(nearestAngle),
                  end: Alignment.center,
                  colors: [
                    const Color(0xFFF3F3F3),
                    KTextStyle.cWhite,
                  ],
                )
              : null,
        ),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Image.asset(
              'assets/flutter_skill/${widget.image}',
              height: 67,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 21,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: KTextStyle.cBlack.withOpacity(0.54),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      widget.title,
                      style: KTextStyle.tBodyS.copyWith(
                        fontWeight: FontWeight.w700,
                        color: KTextStyle.cWhite,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
