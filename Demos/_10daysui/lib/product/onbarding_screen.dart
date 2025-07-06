import 'package:_10daysui/product/langugae/onboarding_screen_widgets/custom_button.dart';
import 'package:_10daysui/product/langugae/onboarding_screen_widgets/custom_card.dart';
import 'package:_10daysui/product/uihelpers.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnbardingScreenMobile extends StatefulWidget {
  const OnbardingScreenMobile({super.key, required this.mqs});
  final ProjectMediaQuery mqs;

  @override
  State<OnbardingScreenMobile> createState() => _OnbardingScreenMobileState();
}

class _OnbardingScreenMobileState extends State<OnbardingScreenMobile> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  void _onPageViewScrolled(int currentPageIndex) {
    setState(() {
      _tabController.index = currentPageIndex;
      _currentPageIndex = currentPageIndex;
    });
  }

  void _onCustomButtonTapped(int index) {
    if (_pageViewController.hasClients) {
      _pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: DraggableButtonEnum.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _customCardView(),
          _customDraggerButtonView(),
          _nextButtonView(),
        ],
      ),
    );
  }

  Padding _nextButtonView() {
    const int totalSteps = 100;
    const double indicatorWidth = 120;
    return Padding(
          padding: Paddings.paddingOnly(top: widget.mqs.height * 0.05),
          child: CircularStepProgressIndicator(
            totalSteps: totalSteps,
            selectedColor: Colorsui.colors_ff5678,
            unselectedColor: Colorsui.colors_grey200,
            currentStep: (_currentPageIndex + 1) * 25,

            width: indicatorWidth,
            height: indicatorWidth,

            child: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  _onCustomButtonTapped(_currentPageIndex + 1);
                },
                icon: Icon(Icons.arrow_forward_outlined, size: widget.mqs.height * 0.05, color: Colorsui.colorsWhite),
              ),
            ),
            roundedCap: (_, __) => true,
          ),
        );
  }

  CustomButton _customDraggerButtonView() {
    return CustomButton(
      mqs: widget.mqs,
      currentPageIndex: _currentPageIndex,
      tabController: _tabController,
      onCustomButtomTapped: _onCustomButtonTapped,
    );
  }

  CustomCard _customCardView() {
    return CustomCard(
      mqs: widget.mqs,
      pageViewController: _pageViewController,
      tabController: _tabController,
      onCustomButtonTapped: _onCustomButtonTapped,
      onPageViewScrolled: _onPageViewScrolled,
    );
  }
}
