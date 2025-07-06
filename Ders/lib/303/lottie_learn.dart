import 'dart:developer';

import 'package:ders/product/constants/duration_items.dart';
import 'package:ders/product/constants/lottie_items.dart';
import 'package:ders/product/global/theme_notifier.dart';
import 'package:ders/product/navigator/navigator_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

//https://lottie.host/41f2388f-4d96-4d31-98ca-a3478e0aee22/flVt28fI7c.lottie
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    //navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(NavigateRoutesEnum.home.path);
  }

  @override
  Widget build(BuildContext context) {
    inspect(LottieItems.themeChange.lottiePath);

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller),
          ),
        ],
      ),
      body: Column(
        children: [Lottie.network('https://lottie.host/5e29ccc1-8dae-4290-8f02-63031447a865/JSRAn2n2Ns.json')],
      ),
    );
  }
}
