import 'package:ders/303/lottie_learn.dart';
import 'package:ders/303/navigator/navigate_home_detail_view.dart';
import 'package:ders/303/navigator/navigate_home_view.dart';
import 'package:ders/404/Bloc/feature/login/view/login_view.dart';

class NavigatorRoutes {
  final items = {
    NavigateRoutesEnum.init.path: (context) => const LoginView(),
    NavigateRoutesEnum.home.path: (context) => const NavigateHomeView(),
    NavigateRoutesEnum.detail.path: (context) => const NaviagteHomeDetail(),
    NavigateRoutesEnum.lottieLearn.path: (context) => const LottieLearn(),

  };
}

enum NavigateRoutesEnum { init, home, detail, lottieLearn }

extension NavigateRoutesExtension on NavigateRoutesEnum {
  String get path {
    switch (this) {
      case NavigateRoutesEnum.init:
        return '/';
      case NavigateRoutesEnum.home:
        return '/home';
      case NavigateRoutesEnum.detail:
        return '/homeDetail';
      case NavigateRoutesEnum.lottieLearn:
      return '/lottieLearn';
    }
  }
}
