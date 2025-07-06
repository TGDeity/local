import 'dart:developer';

import 'package:ders/202/image_learn_202_enum_extensions.dart';
import 'package:ders/303/request_resource/model/resoruce_model.dart';
import 'package:ders/303/request_resource/service/reqres_service.dart';
import 'package:ders/303/request_resource/viewModel/req_res_provider.dart';

import 'package:ders/product/extension/string_extension.dart';
import 'package:ders/product/global/resource_context.dart';
import 'package:ders/product/global/theme_notifier.dart';
import 'package:ders/product/service/project_dio_maneger.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqResViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(
        ReqresService(service),
      ), //TODO: ReqResProvider'ı ChangeNotifier la extends etmeliyiz yoksa hata verir.

      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            actions: [_SaveAndNavigateWidget()],
            title: context.watch<ReqResProvider>().isLoading ? CircularProgressIndicator(color: Colors.red) : null,
          ),
          body: Column(
            children: [
              _tempPlaceHolder(),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (context, index) {
        //inspect(resources[index]);
        inspect(items[index]);
        return Card(
          color: Color(
            items[index].color?.colorValue ?? 0xff000000,
          ), // TODO GlobalExtension ile colorValue get metodunu globalleştirdik.
          child: Text(items[index].name ?? ''),
        );
      },
    );
  }
}

class _SaveAndNavigateWidget extends StatelessWidget {
  const _SaveAndNavigateWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ImageLearn202()));
      },
      child: Icon(Icons.ac_unit),
    );
  }
}

class _tempPlaceHolder extends StatelessWidget {
  const _tempPlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(
      builder: (context, value, child) {
        return value ? Placeholder() : Text('data');
      },
      selector: (context, provider) => provider.isLoading,
    );
  }
}
