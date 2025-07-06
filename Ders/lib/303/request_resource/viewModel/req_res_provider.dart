import 'package:ders/303/request_resource/model/resoruce_model.dart';
import 'package:ders/303/request_resource/service/reqres_service.dart';
import 'package:ders/product/global/resource_context.dart';
import 'package:flutter/material.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading(){
    isLoading = !isLoading;
    notifyListeners(); // TODO Ekrana haber vermek için çağrılır, initState gibi.
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  /*@override // TODO: Provider state olmadığı için initState de yok doğal olarak.
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
    //changeLoading();
  }*/

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext){
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
