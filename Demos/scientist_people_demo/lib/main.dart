import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scientist_people_demo/view/edit_screen_view.dart';
import 'package:scientist_people_demo/view/list_screen_view.dart';
import 'package:scientist_people_demo/viewModel/edit_screen/edit_screen_view_model_mobx.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [Provider<EditScreenViewModel>(create: (_) => EditScreenViewModel())],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _getAppName.toString(),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const ListScreenView(),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route<dynamic>? onGenerateRoute(settings) {
    final data = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ListScreenView());
      case '/edit':
        return MaterialPageRoute(
          builder: (context) {
            final vm = Provider.of<EditScreenViewModel>(context);
            vm.updateFormData(data ?? {});
            return EditScreenView(pushedData: data);
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => const ListScreenView());
    }
  }
}
