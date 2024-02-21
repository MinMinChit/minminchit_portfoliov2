import 'package:flutter/material.dart';

import '../../../constants/color_style.dart';
import '../../../constants/constants.dart';
import '../../../models/app_exp_model.dart';

class ShowcaseSection extends StatefulWidget {
  const ShowcaseSection({
    super.key,
    required this.showcaseStart,
  });

  final bool showcaseStart;
  @override
  State<ShowcaseSection> createState() => _ShowcaseSectionState();
}

List<double> leftPositionList = [130, 120, 110, 100, 90, 80];

class _ShowcaseSectionState extends State<ShowcaseSection> {
  final ScrollController _scrollCtrl = ScrollController();
  List<GlobalKey> keyList = [];

  double myWidth = 500;
  //item width currentContext?.size?.width ?? 0;

  List<AppExpModel> expList = MyConstants.appIconList;

  int selectedIndex = 0;

  double paddingLeft = 0;

  @override
  void initState() {
    for (var i = 0; i < expList.length; i++) {
      keyList.add(GlobalKey());
    }
    _scrollCtrl.addListener(() {});

    super.initState();
  }

  double getPaddingLeftValue(Size size) {
    double leftRight = size.width - (expList.length * 100);
    return leftRight / 2;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    double placement = (size.width / 2) - (myWidth / 2);

    paddingLeft = getPaddingLeftValue(size);

    if (widget.showcaseStart && leftPositionList[0] != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (var i = 0; i < expList.length; i++) {
          leftPositionList[i] = 0;
          animatedToMid(2, duration: 1500);
        }
        setState(() {});
      });
    }

    return Column(
      children: [
        const SizedBox(height: 118),
        Container(
          height: 100,
          padding: EdgeInsets.only(left: paddingLeft),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(expList.length, (index) {
              bool isSelected = selectedIndex == index;
              AppExpModel model = expList[index];
              return Visibility(
                visible: widget.showcaseStart,
                child: AnimatedContainer(
                  width: 100,
                  margin: EdgeInsets.only(right: leftPositionList[index]),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 1500),
                  child: GestureDetector(
                    onTap: () {
                      animatedToMid(index);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: isSelected ? KTextStyle.cAccent : null,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/app_experience/${model.iconPath}',
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isSelected ? model.name : '',
                          style: KTextStyle.tBodyS.copyWith(
                            color: KTextStyle.cAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 28),
        SizedBox(
          height: 294,
          child: ListView.builder(
            cacheExtent: 4000,
            controller: _scrollCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: expList.length,
            itemBuilder: (context, index) {
              AppExpModel model = expList[index];
              return Padding(
                key: keyList[index],
                padding: EdgeInsets.only(
                    left: index == 0 ? placement : 0,
                    right: index == expList.length - 1 ? placement : 0),
                child: ListViewItem(
                  isSelected: selectedIndex == index,
                  model: model,
                  onTap: () {
                    animatedToMid(index);
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  void animatedToMid(int index, {int? duration}) {
    _scrollCtrl.position.ensureVisible(
      keyList[index].currentContext!.findRenderObject()!,
      duration: Duration(milliseconds: duration ?? 280),
      curve: Curves.easeOut,
      alignment: 0.5,
    );
    Future.delayed(const Duration(milliseconds: 180)).then((value) {
      selectedIndex = index;
      setState(() {});
    });
  }
}

class ListViewItem extends StatefulWidget {
  const ListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.model,
  });
  final bool isSelected;
  final Function() onTap;
  final AppExpModel model;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 294,
        width: 500,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected ? KTextStyle.cAccent : null,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          height: 284,
          width: 490,
          decoration: BoxDecoration(
            color: widget.model.backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Image.asset('assets/app_experience/${widget.model.imagePath}'),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.model.name,
                      style: KTextStyle.tTitleS.copyWith(
                        color: widget.model.textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Aenean adipiscing a nunc felis. Arcu aliquet in pellentesque.',
                      style: KTextStyle.tBodyM.copyWith(
                        color: widget.model.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
