import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_style.dart';
import '../../../constants/constants.dart';

class OtherSkillSession extends StatelessWidget {
  const OtherSkillSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Specialized in Flutter, but not falling short in..',
          style: KTextStyle.tTitleM,
        ),
        const SizedBox(height: 44),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            MyConstants.otherSkillList.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(left: index != 0 ? 48 : 0),
                child: AnimatedSkillImage(
                  image: MyConstants.otherSkillList[index],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 112),
      ],
    );
  }
}

class AnimatedSkillImage extends StatefulWidget {
  const AnimatedSkillImage({super.key, required this.image});

  final String image;
  @override
  State<AnimatedSkillImage> createState() => _AnimatedSkillImageState();
}

class _AnimatedSkillImageState extends State<AnimatedSkillImage> {
  double paddingAll = 8;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() {
          paddingAll = 8;
        });
      },
      onEnter: (event) {
        setState(() {
          paddingAll = 0;
        });
      },
      child: AnimatedContainer(
        width: 80,
        height: 80,
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.all(paddingAll),
        child: SvgPicture.asset('assets/other_skill/${widget.image}'),
      ),
    );
  }
}
