import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mmc_portfoliov2/constants/color_style.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/responsive.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoLink,
  });
  final String videoLink;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool showPauseIcon = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoLink),
    )..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      if (_controller.value.isCompleted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return isMobile
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: false
                ? Container()
                : AspectRatio(
                    aspectRatio: 1.33,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              showPauseIcon = true;
                            });
                          },
                          child: IgnorePointer(
                            child: VideoPlayer(_controller),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: !isPlaying
                              ? GestureDetector(
                                  onTap: () {
                                    isPlaying = true;
                                    _controller.play();
                                    setState(() {});
                                  },
                                  child:
                                      SvgPicture.asset('assets/icons/play.svg'))
                              : const SizedBox.shrink(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: showPauseIcon
                              ? GestureDetector(
                                  onTap: () {
                                    isPlaying = false;
                                    showPauseIcon = false;
                                    _controller.pause();
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                      'assets/icons/pause.svg'))
                              : const SizedBox.shrink(),
                        ),

                        // VideoProgressIndicator(_controller,
                        //     allowScrubbing: true),
                      ],
                    ),
                  ),
          )
        : SizedBox(
            height: 332,
            width: 442.6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: false
                  ? Container()
                  : AspectRatio(
                      aspectRatio: 1.33,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                showPauseIcon = true;
                              });
                            },
                            child: IgnorePointer(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AspectRatio(
                                  aspectRatio: 1.33,
                                  child: VideoPlayer(_controller),
                                ),
                              ),
                            ),
                          ),
                          !isPlaying
                              ? AspectRatio(
                                  aspectRatio: 1.33,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            KTextStyle.cBlack.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(8)),
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Align(
                            alignment: Alignment.center,
                            child: !isPlaying
                                ? GestureDetector(
                                    onTap: () {
                                      isPlaying = true;
                                      _controller.play();
                                      setState(() {});
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/play.svg'))
                                : const SizedBox.shrink(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: showPauseIcon
                                ? GestureDetector(
                                    onTap: () {
                                      isPlaying = false;
                                      showPauseIcon = false;
                                      _controller.pause();
                                      setState(() {});
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/pause.svg'))
                                : const SizedBox.shrink(),
                          ),
                          // VideoProgressIndicator(_controller,
                          //     allowScrubbing: true),
                        ],
                      ),
                    ),
            ),
          );
  }
}
