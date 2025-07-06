import 'package:ders/202/state_manage/state_manage_learn_view.dart';
import 'package:flutter/material.dart';

//servis bağlantısı, değişiklik vs vs Logicler burada yönetilmelidir.
//Ekrandaki viewlar ler ...view da yönetilmelidir.

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  changeVisible() {
    setState(() {
      isVisible = !isVisible;
      isOpacity = !isOpacity;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
  

}
