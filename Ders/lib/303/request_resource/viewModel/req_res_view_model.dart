
import 'package:ders/303/request_resource/model/resoruce_model.dart';
import 'package:ders/303/request_resource/service/reqres_service.dart';
import 'package:ders/303/request_resource/view/req_res_view.dart';
import 'package:ders/product/service/project_dio_maneger.dart';
import 'package:flutter/material.dart';

abstract class ReqResViewModel extends LoadingStateFull2<ReqResView> with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = []; // <ResourceModel>

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
    //changeLoading();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}

// TODO: SharedLear dersindeki class
abstract class LoadingStateFull2<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}


