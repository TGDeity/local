import 'package:flutter/material.dart';

final double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  //Text('data', style: context.textTheme().headlineLarge)
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
      _isOpacity = !_isOpacity;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0, duration: _DurationItems.durationLow, curve: Curves.linearToEaseOut);
        },
      ),
      body: Column(
        children: [
          _animatedCrossFadeWidget(),
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity ? 1 : 0,
              duration: _DurationItems.durationLow,
              child: Text('data'),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeOpacity();
              },
              icon: Icon(Icons.chevron_right),
            ),
          ),
          AnimatedDefaultTextStyle(
            //curve: Curves.bounceInOut,
            style:
                (_isVisible ? context.textTheme().headlineLarge : context.textTheme().bodyLarge) ?? const TextStyle(),
            duration: _DurationItems.durationLow,
            child: Text('AnimatedDefaultTextStyle'),
          ),
          AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: controller),
          AnimatedContainer(
            height: _isVisible ? kZero : (MediaQuery.of(context).size.width) * 0.2,
            width: (MediaQuery.of(context).size.height) * 0.4,
            duration: _DurationItems.durationLow,
            color: Colors.red,
            margin: EdgeInsets.all(10),
            //child: const Placeholder(),
          ),
          Container(
            width: (MediaQuery.of(context).size.height) * 0.2,
            height: !_isVisible
                ? (MediaQuery.of(context).size.height) * 0.2
                : (MediaQuery.of(context).size.height) * 0.1,
            color: Colors.amber,
            child: AnimatedList(
              shrinkWrap: true,
              initialItemCount: 1,
              itemBuilder: (context, index, animation) {
                return Text('dataasd');
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.ease,
                  bottom: 100,
                  top: _isVisible ? 0 : 100,
                  duration: _DurationItems.durationLow,
                  child: const Placeholder(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _animatedCrossFadeWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLowest,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() => Theme.of(this).textTheme;
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
  static const durationLowest = Duration(milliseconds: 500);
}
