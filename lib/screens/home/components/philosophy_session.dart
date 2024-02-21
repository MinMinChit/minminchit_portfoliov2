import 'package:flutter/material.dart';
import 'package:mmc_portfoliov2/models/philosophy_model.dart';

import '../../../constants/color_style.dart';
import '../../../constants/constants.dart';

class PhilosophySession extends StatefulWidget {
  const PhilosophySession({
    super.key,
    required this.philosophyStart,
  });

  final bool philosophyStart;

  @override
  State<PhilosophySession> createState() => _PhilosophySessionState();
}

List<double> topPositionList = [80, 100, 120, 180];

class _PhilosophySessionState extends State<PhilosophySession> {
  List<PhilosophyModel> philosophyList = MyConstants.philosophyList;

  @override
  Widget build(BuildContext context) {
    if (widget.philosophyStart && topPositionList[0] != 0) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        for (var i = 0; i < philosophyList.length; i++) {
          topPositionList[i] = 0;
        }
        setState(() {});
      });
    }
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'My Development Philosophy',
          style: KTextStyle.tTitleM,
        ),
        const SizedBox(height: 88),
        Wrap(
          runSpacing: 86,
          spacing: 86,
          children: List.generate(philosophyList.length, (index) {
            return Visibility(
              visible: widget.philosophyStart,
              child: AnimatedContainer(
                padding: EdgeInsets.only(top: topPositionList[index]),
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 457,
                  height: 240,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'assets/philosophy/${MyConstants.philosophyList[index].image}',
                          height: 151,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        MyConstants.philosophyList[index].title,
                        style: KTextStyle.tTitleS,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        MyConstants.philosophyList[index].content,
                        style: KTextStyle.tBodyM.copyWith(
                          color: KTextStyle.c42Gray,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
