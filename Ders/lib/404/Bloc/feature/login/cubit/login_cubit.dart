import 'package:ders/404/Bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:ders/404/Bloc/feature/login/model/login_model.dart';
import 'package:ders/404/Bloc/feature/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService) : _loginService = loginService, super(LoginState());
  final ILoginService _loginService;

  Future<void> checkUser(String email, String password) async {
    emit(
      state.copyWith(
        isLoading: true,
        loginModel: LoginModel(email: email, password: password),
      ),
    ); //ekrana haber vermek istiyorsun
    final response = await _loginService.login(state.loginModel!);

    emit(state.copyWith(isLoading: false, isCompleted: response.data != null));
  }
}
