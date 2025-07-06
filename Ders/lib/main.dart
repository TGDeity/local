// ignore_for_file: unused_import
import 'dart:io';
import 'package:ders/101/app_bar.learn.dart';
import 'package:ders/101/button_learn.dart';
import 'package:ders/101/card_learn.dart';
import 'package:ders/101/color_learn.dart';
import 'package:ders/101/column_row_learn.dart';
import 'package:ders/101/container_sized_box_learn.dart';
import 'package:ders/101/custom_widget_learn.dart';
import 'package:ders/101/icon_learn.dart';
import 'package:ders/101/image_learn.dart';
import 'package:ders/101/indicator_learn.dart';
import 'package:ders/101/list_tile.learn.dart';
import 'package:ders/101/list_view_builder.dart';
import 'package:ders/101/list_view_learn.dart';
import 'package:ders/101/padding_learn.dart';
import 'package:ders/101/page_view.dart';
import 'package:ders/101/scaffold_learn.dart';
import 'package:ders/101/stack_learn.dart';
import 'package:ders/101/stateful_learn.dart';
import 'package:ders/101/statefull_life_cycle_learn.dart';
import 'package:ders/101/stateless_learn.dart';
import 'package:ders/101/text_learn.dart';
import 'package:ders/101/textfiled_learn.dart';
import 'package:ders/202/alert_learn.dart';
import 'package:ders/202/animated_learn_view.dart';
import 'package:ders/202/cache/secure_context/secure_context_learn.dart';
import 'package:ders/202/cache/shared_learn_cache.dart';
import 'package:ders/202/cache/shared_list_cache.dart';
import 'package:ders/202/form_learn_view.dart';
import 'package:ders/202/image_learn_202_enum_extensions.dart';
import 'package:ders/202/model_learn_view.dart';
import 'package:ders/202/oop_learn_view.dart';
import 'package:ders/202/package_learn_view.dart';
import 'package:ders/202/service/service_learn_get_view.dart';
import 'package:ders/202/service/service_post_learn_view.dart';
import 'package:ders/202/sheet_learn.dart';
import 'package:ders/202/state_manage/state_manage_learn_view.dart';
import 'package:ders/202/tab_learn.dart';
import 'package:ders/202/theme/light_theme.dart';
import 'package:ders/202/theme_learn_view.dart';
import 'package:ders/202/widget_size_enum_learn_view.dart';
import 'package:ders/303/callback_learn.dart';
import 'package:ders/303/lottie_learn.dart';
import 'package:ders/303/mobx_image_picker/view/mobx_image_upload_view.dart';
import 'package:ders/303/navigator/navigate_home_detail_view.dart';
import 'package:ders/303/navigator/navigate_home_view.dart';
import 'package:ders/303/part/part_of_learn.dart';
import 'package:ders/303/request_resource/service/reqres_service.dart';
import 'package:ders/303/request_resource/view/req_res_view.dart';
import 'package:ders/303/request_resource/viewModel/req_res_provider.dart';
import 'package:ders/404/Bloc/feature/login/view/login_view.dart';
import 'package:ders/404/Bloc/product/init/localization_init.dart';
import 'package:ders/404/Bloc/product/init/product_init.dart';
import 'package:ders/demos/color_demos_view.dart';
import 'package:ders/demos/color_life_cycle_view.dart';
import 'package:ders/demos/my_collections_demos.dart';
import 'package:ders/demos/notes_example_view.dart';
import 'package:ders/demos/stack_demo_view.dart';
import 'package:ders/demos/tg_demos.dart';
import 'package:ders/product/constants/lottie_items.dart';
import 'package:ders/product/global/resource_context.dart';
import 'package:ders/product/global/theme_notifier.dart';
import 'package:ders/product/navigator/navigator_custom.dart';
import 'package:ders/product/navigator/navigator_maneger.dart';
import 'package:ders/product/navigator/navigator_routes.dart';
import 'package:ders/product/service/project_dio_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //_isWindows();
  final productInit = ProductInit();
  final localizationInit = LocalizationInit();
  await productInit.mainInitialize();

  runApp(
    EasyLocalization(
      supportedLocales: localizationInit.supportedLocales,
      path: localizationInit.localizationPath, // <-- change the path of the translation files
      fallbackLocale: localizationInit
          .ballbackLocale, //Proje başlarken bununla başlasın ya da bulunuamadığında bu olsun demek için kullanmak şart değil .
      child: MultiProvider(providers: productInit.providers, builder: (context, child) => const MyApp()),
    ),
  );

  /* runApp(
    MultiProvider(
      providers: [
        Provider<ResourceContext>(create: (_) => ResourceContext()), // TODO: Data tutacaksan
        ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()), // TODO: Ekrana haber vereceksen.
        ChangeNotifierProvider<ReqResProvider>(
          create: (context) => ReqResProvider(ReqresService(ProjectDioClass1().serviceClass)),
        ), // TODO: Ekrana haber vereceksen>
      ],
      builder: (context, child) => const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates, //LOCALİZATİONS
      supportedLocales: context.supportedLocales, //LOCALİZATİONS
      //home: const LoginView(),
      routes: NavigatorRoutes().items,
      initialRoute: '/',

      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: child ?? SizedBox(),
      ),

      //onUnknownRoute: _sayfaBulunamadi,
      //onGenerateRoute: NavigatorCustom().onGenerateRoute, //TODO sayfalar üretildikten sonra yapılsın ya da sayfaya giderken ne kontrol edilsin vs vs. OnGenearteRoute kullanılırken scaffolddaki routes kullanılamaz ikisinden birisi tercih edilmelidir.
      //navigatorKey: NavigatorManager303.instance.navigatorGlobalKey

      /*ThemeData.dark().copyWith(
        //buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1))),
        //tabBarTheme: TabBarThemeData(labelColor: Colors.white, unselectedLabelColor: Colors.amber),
        //bottomAppBarTheme: BottomAppBarTheme(),
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme: ProgressIndicatorThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: StadiumBorder())),
        iconTheme: IconThemeData(color: Colors.amber),
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ), //Projedeki tüm Cardlara etki eder.
        inputDecorationTheme: InputDecorationTheme(filled: true),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          // color: Colors.red
        ),
      ),*/
    );
  }

  Route<dynamic>? _sayfaBulunamadi(settings) => MaterialPageRoute(
    builder: (context) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Lottie.network(
                'https://lottie.host/5e29ccc1-8dae-4290-8f02-63031447a865/JSRAn2n2Ns.json',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Olamaz! aradığınız sayfa uzay boşluğunda kayboldu.',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network(
                    'https://lottie.host/98a61118-fd75-49fe-aed0-8cfc928edf50/cmrlbRk87z.json',
                    height: 90,
                    width: 90,
                  ),
                  Text('Dünyaya Işınlan', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
