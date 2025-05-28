import 'package:flutter/material.dart';
import 'package:loginuidemo/product/colors.dart';
import 'package:loginuidemo/product/language/language_items.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Positioned(
                  height: _LoginPageKits.height(context, flex: 0.4),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    
                    color: UIColors.login_page_ffb55,
                    //height: _LoginPageKits.height(context, flex: 0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginCircleAvatar(),
                          Text(
                            LanguageItems.loginPage_item_tolga,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: _LoginPageKits.height(context, flex: 0.05),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              //height: _LoginPageKits.height(context, flex: 0.6),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginCircleAvatar extends StatelessWidget {
  const LoginCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: UIColors.login_page_fffff,
      maxRadius: _LoginPageKits.height(context, flex: 0.1),
      child: Center(
        child: Text(
          LanguageItems.loginPage_item_r,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: _LoginPageKits.height(context, flex: 0.1),
            color: UIColors.login_page_ffb55,
          ),
        ),
      ),
    );
  }
}

class _LoginPageKits {
  static double height(BuildContext context, {double flex = 1}) =>
      MediaQuery.of(context).size.height * flex;

  static double width(BuildContext context, {double flex = 1}) =>
      MediaQuery.of(context).size.height * flex;
}
