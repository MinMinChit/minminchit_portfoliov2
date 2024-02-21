import 'package:flutter/material.dart';

import '../../../../constants/color_style.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 33,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: KTextStyle.c8dGray2.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: KTextStyle.tBodyS.copyWith(
              fontWeight: FontWeight.w700,
              color: KTextStyle.cWhite,
            ),
          ),
        ],
      ),
    );
  }
}
