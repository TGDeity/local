//TODO prodivederlar burada toplanabilir örnek olarak.

import 'package:ders/303/request_resource/service/reqres_service.dart';
import 'package:ders/303/request_resource/viewModel/req_res_provider.dart';
import 'package:ders/404/Bloc/product/init/localization_init.dart';
import 'package:ders/product/global/resource_context.dart';
import 'package:ders/product/global/theme_notifier.dart';
import 'package:ders/product/service/project_dio_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();

  final List<SingleChildWidget> providers = [
    Provider<ResourceContext>(create: (_) => ResourceContext()), // TODO: Data tutacaksan
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()), // TODO: Ekrana haber vereceksen.
    ChangeNotifierProvider<ReqResProvider>(
      create: (context) =>
          ReqResProvider(ReqresService(ProjectDioClass1().serviceClass)), // TODO: Ekrana haber vereceksen>
    ),
  ];

  Future<void> mainInitialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
