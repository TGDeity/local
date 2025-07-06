import 'package:_10daysui/product/uihelpers.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.mqs,
    required this.imgPath,
    required this.title,
    required this.comments,

    required this.callback,
  });

  final String imgPath; // = 'assets/png/Open Doodles Garden Life.png';
  final ProjectMediaQuery mqs;
  final String title;
  final String comments;

  final void Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      //411.4, 914.3
      children: [_imgBox(), _headLineTitle(context), _comments(context)],
    );
  }

  Expanded _comments(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: Paddings.paddingOnly(top: mqs.height * 0.04, right: mqs.width * 0.01, left: mqs.width * 0.01),
        child: Text(comments, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }

  Expanded _headLineTitle(BuildContext context) =>
      Expanded(flex: 1, child: Text(title, style: Theme.of(context).textTheme.headlineMedium));

  Expanded _imgBox() {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: Paddings.paddingOnly(top: mqs.height * 0.01, bottom: mqs.height * 0.01),
        child: SizedBox(width: mqs.width, height: mqs.height * 0.4, child: Image.asset(imgPath)),
      ),
    );
  }
}
