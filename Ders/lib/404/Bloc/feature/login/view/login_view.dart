import 'package:ders/404/Bloc/feature/login/cubit/login_cubit.dart';
import 'package:ders/404/Bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:ders/404/Bloc/feature/login/service/login_service.dart';
import 'package:ders/404/Bloc/product/init/lang/locale_keys.g.dart';
import 'package:ders/404/Bloc/product/service/vexana_network_manager.dart';
import 'package:ders/product/navigator/navigator_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

part 'login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginText2 = LocaleKeys.login_login.tr();//! locaklization
  final TextEditingController textEditingControllerEmail = TextEditingController();
  final TextEditingController textEditingControllerPsword = TextEditingController();
  final GlobalKey<FormState> formLoginKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      //Blockları yakalamak için tanımlıyoruz.
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          actions: [Text(loginText2)],
          title: BlocBuilder<LoginCubit, LoginState>(
            //sen loginCUbitsin ve loginState'e bakıyorsun.
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(color: context.general.appTheme.secondaryHeaderColor)
                  : SizedBox.shrink();
            },
          ),
        ),
        body: Form(
          key: formLoginKey,
          child: _LoginEmailFields(
            formLoginKey: formLoginKey,
            emailController: textEditingControllerEmail,
            textEditingControllerPsword: textEditingControllerPsword,
          ),
        ),
      ),
    );
  }
}
