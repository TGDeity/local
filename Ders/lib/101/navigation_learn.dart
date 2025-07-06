import 'package:ders/101/navigate_detal_learn.dart';
import 'package:flutter/material.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {

  List<int> selectedItems = [];

  _NavigationLearnState();
  void addSelected(int index,bool isAdd) {
   
    setState(() {

      isAdd ? selectedItems.add(index) : selectedItems.remove(index);

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () async {
              //navigateToWidget(context, NavigateDetailLearnDart());
              final response = await navigateToWidgetNormal(context, NavigateDetailLearnDart(isOkey: selectedItems.contains(index),));

              if (response is bool) {
                addSelected(index,response);
                print('sayfada geri gelindi değer $response');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Placeholder(color: selectedItems.contains(index) ? Colors.green : Colors.red),
            ),
          );
        },
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: false, //IOStaki animasyonla ekrana geliyor ve geri dön tuşu yerine çarpı tuşu değişiyor.
        settings: RouteSettings(),
        builder: (context) => widget,
      ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        //fullscreenDialog: false, //IOStaki animasyonla ekrana geliyor ve geri dön tuşu yerine çarpı tuşu değişiyor.
        settings: RouteSettings(),
        builder: (context) => widget,
      ),
    );
  }
}
