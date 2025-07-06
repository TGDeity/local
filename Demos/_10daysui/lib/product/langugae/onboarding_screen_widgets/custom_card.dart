import 'package:_10daysui/product/langugae/language.dart';
import 'package:_10daysui/product/langugae/onboarding_screen_widgets/custom_pageview.dart';
import 'package:_10daysui/product/uihelpers.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.mqs,
    required this.pageViewController,
    required this.tabController,
    required this.onPageViewScrolled,
    required this.onCustomButtonTapped,
  });

  final ProjectMediaQuery mqs;
  final PageController pageViewController;
  final TabController tabController;
  final void Function(int) onPageViewScrolled;
  final void Function(int) onCustomButtonTapped;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView(
        allowImplicitScrolling: false,
        scrollDirection: Axis.horizontal,
        controller: widget.pageViewController,
        onPageChanged: widget.onPageViewScrolled,
        children: _customPageViewGenerator2(),
      ),
    );
  }

  List<CustomPageView> _customPageViewGenerator2() {
    List<CustomPageView> pages1 = [];
    Map<String, List> imgPathLib = {
      'Open Doodles Garden Life2.png': [Language.onBoardingTitlePage0, Language.onBoardingCommentPage0],
      'Open Doodles Garden Life.png': [Language.onBoardingTitlePage1, Language.onBoardingCommentPage1],
      'Open Doodles In a Hurry.png': [Language.onBoardingTitlePage2, Language.onBoardingCommentPage2],
      'Open Doodles Swift.png': [Language.onBoardingTitlePage3, Language.onBoardingCommentPage3],
    };

    imgPathLib.forEach((key, value) {
      pages1.add(
        CustomPageView(
          mqs: widget.mqs,
          imgPath: 'assets/png/onbarding/$key',
          title: value[0],
          comments: value[1],
          callback: widget.onCustomButtonTapped,
        ),
      );
    });
    return pages1;
  }
}

class CustomPageViewModelItems {
  final String imgPath;
  final String title;
  final String comments;
  final ProjectMediaQuery mqs;
  final void Function(int) onCustomButtonTapped;

  CustomPageViewModelItems(this.mqs, this.imgPath, this.title, this.comments, this.onCustomButtonTapped);

  customPageGenerator(String imgPath, String title, String comments, ProjectMediaQuery mqs) {
    return CustomPageView(mqs: mqs, imgPath: imgPath, title: title, comments: comments, callback: onCustomButtonTapped);
  }
}
