import 'package:flutter/material.dart';

import '../../../constants/color_style.dart';
import '../../../constants/constants.dart';
import '../../../models/profect_video_model.dart';
import '../widgets/category_tab.dart';
import '../widgets/video_widget.dart';

class VideoSession extends StatelessWidget {
  const VideoSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KTextStyle.c4bGray1,
      child: Column(
        children: List.generate(MyConstants.projectVideoList.length, (index) {
          ProjectVideoModel model = MyConstants.projectVideoList[index];
          return VideoSessionItem(model: model, index: index);
        }),
      ),
    );
  }
}

class VideoSessionItem extends StatefulWidget {
  const VideoSessionItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ProjectVideoModel model;
  final int index;
  @override
  State<VideoSessionItem> createState() => _VideoSessionItemState();
}

class _VideoSessionItemState extends State<VideoSessionItem> {
  @override
  Widget build(BuildContext context) {
    bool reverse = widget.index % 2 != 0;
    return Container(
      height: 500,
      decoration: BoxDecoration(
          color: reverse ? KTextStyle.c42Gray : KTextStyle.c4bGray1),
      child: Container(
        height: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reverse
                ? VideoPlayerWidget(
                    videoLink: widget.model.videoUrl,
                  )
                : Container(
                    width: 460,
                    height: 332,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.title,
                          style: KTextStyle.tTitleM.copyWith(
                            color: KTextStyle.cWhite,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: List.generate(widget.model.typeList.length,
                              (index) {
                            return CategoryTab(
                                text: widget.model.typeList[index]);
                          }),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.model.content,
                          style: KTextStyle.tBodyM.copyWith(
                            color: KTextStyle.cWhite,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          children: List.generate(widget.model.iconList.length,
                              (index) {
                            return Image.asset(
                              'assets/icons/${widget.model.iconList[index]}',
                              width: 48,
                              height: 48,
                            );
                          }),
                        )
                      ],
                    ),
                  ),
            const SizedBox(width: 32),
            reverse
                ? Container(
                    width: 460,
                    height: 332,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.title,
                          style: KTextStyle.tTitleM.copyWith(
                            color: KTextStyle.cWhite,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: List.generate(widget.model.typeList.length,
                              (index) {
                            return CategoryTab(
                                text: widget.model.typeList[index]);
                          }),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.model.content,
                          style: KTextStyle.tBodyM.copyWith(
                            color: KTextStyle.cWhite,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          children: List.generate(widget.model.iconList.length,
                              (index) {
                            return Image.asset(
                              'assets/icons/${widget.model.iconList[index]}',
                              width: 48,
                              height: 48,
                            );
                          }),
                        )
                      ],
                    ),
                  )
                : VideoPlayerWidget(
                    videoLink: widget.model.videoUrl,
                  )
          ],
        ),
      ),
    );
  }
}
