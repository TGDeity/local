import 'package:ders/404/Bloc/feature/login/model/login_model.dart';
import 'package:ders/404/Bloc/feature/login/service/login_service.dart';
import 'package:ders/404/Bloc/product/model/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;

  setUp(() {
    loginService = LoginService(NetworkManager<TokenModel>(options: BaseOptions(baseUrl: 'https://reqres.in/',headers: {
      "x-api-key":"reqres-free-v1",

    })));
  });

  test('login test', () async {
    final response = await loginService.login(LoginModel(email: 'eve.holt@reqres.in', password: 'cityslicka'));

    //print(response.data);
    expect(response.data, isNotNull);
  });


  
}
