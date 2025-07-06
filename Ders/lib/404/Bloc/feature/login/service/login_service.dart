import 'package:ders/404/Bloc/feature/login/model/login_model.dart';
import 'package:ders/404/Bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);

  Future<IResponseModel<TokenModel?, INetworkModel?>> login(LoginModel model);

  final String _loginPath ='api/login';

}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel?>> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(
      _loginPath,
      parseModel: TokenModel(),
      method: RequestType.POST,
      data: model,
    );
  }
}
