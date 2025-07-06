// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ders/404/Bloc/feature/login/model/login_model.dart';
import 'package:ders/404/Bloc/product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? loginModel;
  final bool isCompleted;
  final TokenModel? tokenModel;

  const LoginState({this.isLoading = false, this.loginModel, this.isCompleted = false, this.tokenModel});

  @override
  List<Object?> get props => [isLoading, loginModel]; //isLoading, loginModel .. değişmedikçe sayfayı tetiklememesini sağlıyoruz.

  LoginState copyWith({
    bool? isLoading,
    LoginModel? loginModel,
    bool? isCompleted,
    TokenModel? tokenModel,
  }) {
    return LoginState(
      isLoading: isLoading ?? false, //isLoading adamın yolladığıdır sürekli eskisini kopyalama diyoruz.
      loginModel: loginModel ?? this.loginModel,
      isCompleted: isCompleted ?? false, //adamın yolladığıdır sürekli eskisini kopyalama diyoruz. diğer türlü hep isCompletedin son değerini kopyalyacak güzel bir kullanım.
      tokenModel: tokenModel ?? this.tokenModel,
    );
  }
}

/* standartta böyle yapılıyor ama best practiles için Login abstract class LoginState yerine class LoginState ile equtablesi birleştiriyoruz.
class LoginInitial extends LoginState{
  
  final bool isLoading = false;
}
*/
