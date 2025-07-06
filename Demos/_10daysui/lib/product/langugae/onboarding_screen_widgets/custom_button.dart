import 'dart:async';

import 'package:_10daysui/product/uihelpers.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.mqs,
    required this.tabController,
    required this.currentPageIndex,
    required this.onCustomButtomTapped,
  });
  final ProjectMediaQuery mqs;
  final TabController tabController;
  final int currentPageIndex;
  final Function(int) onCustomButtomTapped;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with Paddings {
  @override //IconButton ile update olan değeri eşitliyoruz ve ekrana çizdiriyoruz.
  didUpdateWidget(CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentButtonValue = widget.currentPageIndex;
  }

  int _currentButtonValue = 0;
  @override
  void initState() {
    super.initState();
    _currentButtonValue = widget.currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: AnimatedToggleSwitch.size(
        allowUnlistedValues: false,
        indicatorSize: Size.fromWidth(20),
        borderWidth: 0,
        active: true,
        onChanged: (value) {
          //print('value: $value');
          widget.onCustomButtomTapped(value);
        },

        //padding: EdgeInsets.all(18),
        iconList: _iconBuilder(),
        styleList: _buttonStyleList(),
        onTap: onTapButton,
        current: _currentButtonValue,
        values: _buttonIndexesList(),
      ),
    );
  }

  FutureOr<void> onTapButton(TapProperties props) {
    setState(() {
      if (props.tapped != null) {
        _currentButtonValue = props.tapped!.index;
      } else {
        _currentButtonValue = 0;
      }
    });
  }

  List<Widget> _iconBuilder() {
    List<Widget> iconList = [];

    for (int i = 0; i < DraggableButtonEnum.values.length; i++) {
      //iconList.add(Icon(Icons.circle, color: Colorsui.colors_493e8a, size: widget.mqs.height * 0.02));
      const double radius = 5;
      iconList.add(
        Padding(
          padding: Paddings.paddingSymetric(horizontal: (widget.mqs.height) * 0.005),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: Colorsui.colors_493e8a),

            width: widget.mqs.width * 0.06,
            height: widget.mqs.height * 0.01,
          ),
        ),
      );
    }
    return iconList;
  }

  List<int> _buttonIndexesList() {
    List<int> indexList = [];
    for (var i = 0; i < DraggableButtonEnum.values.length; i++) {
      indexList.add(i);
    }
    return indexList;
  }

  List<ToggleStyle> _buttonStyleList() {
    List<ToggleStyle> indexList = [];
    for (var i = 0; i < DraggableButtonEnum.values.length; i++) {
      indexList.add(ToggleStyle());
    }
    return indexList;
  }
}

enum DraggableButtonEnum { zero, one, two, three }
