import 'package:ders/404/Bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

class VexanaNetworkManager extends NetworkManager<TokenModel> {
  VexanaNetworkManager()
    : super(
        options: BaseOptions(baseUrl: 'https://reqres.in/', headers: {"x-api-key": "reqres-free-v1"}),
      );
}
