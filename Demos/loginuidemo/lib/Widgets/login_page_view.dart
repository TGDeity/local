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
          Expanded(flex: 1, child: Stack(children: [AvatarTextContainer(), SignTextfiledContainer()])),
        ],
      ),
    );
  }
}

class SignTextfiledContainer extends StatelessWidget {
  const SignTextfiledContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: _LoginPageKits.height(context, flex: 0.4),
      //width: _LoginPageKits.width(context, flex: 1),
      //height: _LoginPageKits.height(context, flex: 12),
      child: Container(
        decoration: BoxDecoration(
          color: UIColors.login_page_fffff,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_LoginPageKits._cardBorderRadius),
            topRight: Radius.circular(_LoginPageKits._cardBorderRadius),
          ),
        ),
        child: SignTextFieldContainerIcTasarim(),
      ),
    );
  }
}

class SignTextFieldContainerIcTasarim extends StatefulWidget {
  const SignTextFieldContainerIcTasarim({super.key});

  @override
  State<SignTextFieldContainerIcTasarim> createState() => _SignTextFieldContainerIcTasarimState();
}

class _SignTextFieldContainerIcTasarimState extends State<SignTextFieldContainerIcTasarim> {
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_LoginPageKits.height(context, flex: 0.03)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_signInText(context), _userName(context), _password(context), _signInButton(), _forgotPassword()],
      ),
    );
  }

  Text _forgotPassword() => Text(LanguageItems.loginPage_item_forgotPassword);

  OutlinedButton _signInButton() => OutlinedButton(onPressed: () {}, child: Text(LanguageItems.loginPage_item_SignIn));

  TextField _password(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      style: _LoginPageTextStyle.passwordAndUserName(context),
      decoration: InputDecoration(
        labelText: LanguageItems.loginPage_item_password,
        border: OutlineInputBorder(),
        labelStyle: _LoginPageTextStyle.passwordAndUserName(context),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: _obscureText ? Icon(Icons.visibility_off,color: UIColors.login_page_ff5b55,) : Icon(Icons.visibility, color: UIColors.login_page_707070),
        ),
        //helper: Text("data")
      ),
    );
  }

  TextField _userName(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(

        hint: Text(LanguageItems.loginPage_item_realtgod),
        labelText: "User Name",
        border: OutlineInputBorder(),
        labelStyle: _LoginPageTextStyle.passwordAndUserName(context),
      ),
      style: _LoginPageTextStyle.passwordAndUserName(context),
    );
  }

  Row _signInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 1, width: _LoginPageKits.width(context, flex: 0.2), color: UIColors.login_page_707070),
        Text(
          LanguageItems.loginPage_item_SignIn,
          style: _LoginPageTextStyle.itemRamni(context).copyWith(color: UIColors.login_page_ff5b55),
        ),
        Container(color: UIColors.login_page_707070, height: 1, width: _LoginPageKits.width(context, flex: 0.2)),
      ],
    );
  }
}

class AvatarTextContainer extends StatelessWidget {
  const AvatarTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //height: _LoginPageKits.height(context, flex: 0.6),
      child: Container(
        color: UIColors.login_page_ff5b55,
        height: _LoginPageKits.height(context, flex: 0.6),
        width: _LoginPageKits.width(context, flex: 1),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _LoginPageKits.height(context, flex: 0.15)),
                child: Column(
                  children: [
                    LoginCircleAvatar(),
                    Padding(
                      padding: EdgeInsets.only(top: _LoginPageKits.height(context, flex: 0.01)),
                      child: Text(LanguageItems.loginPage_item_tolga, style: _LoginPageTextStyle.itemRamni(context)),
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

class LoginCircleAvatar extends StatelessWidget {
  const LoginCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: UIColors.login_page_fffff,
      maxRadius: _LoginPageKits.height(context, flex: 0.05),
      child: Center(child: Text(LanguageItems.loginPage_item_r, style: _LoginPageTextStyle.itemr(context))),
    );
  }
}

class _LoginPageTextStyle {
  static itemr(BuildContext context) => Theme.of(context).textTheme.bodyLarge?.copyWith(
    fontSize: _LoginPageKits.height(context, flex: 0.07),
    color: UIColors.login_page_ff5b55,
  );
  static itemRamni(BuildContext context) => Theme.of(context).textTheme.bodyLarge?.copyWith(
    fontSize: _LoginPageKits.height(context, flex: 0.02),
    color: UIColors.login_page_fffff,
    fontWeight: FontWeight.w700,
  );

  static passwordAndUserName(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium?.copyWith(color: UIColors.login_page_21293b, fontWeight: FontWeight.w400, fontSize: 17);
}

class _LoginPageKits {
  static double height(BuildContext context, {double flex = 1}) => MediaQuery.of(context).size.height * flex;

  static double width(BuildContext context, {double flex = 1}) => MediaQuery.of(context).size.width * flex;

  static final double _cardBorderRadius = 20.0;

  //static double padding = 0;
}
