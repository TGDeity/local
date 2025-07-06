import 'package:ders/product/navigator/navigator_routes.dart';
import 'package:flutter/material.dart';

class NavigatorManager303 {

    NavigatorManager303._();
    static NavigatorManager303 instance = NavigatorManager303._(); //singelton

    final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey(); 
    GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;


    void pushToPage(NavigateRoutesEnum route){

      _navigatorGlobalKey.currentState!.pushNamed(route.name);
      
    }

}