import 'package:ders/202/state_manage/state_learn_view_model.dart';
import 'package:flutter/material.dart';

//EKRAN Viewları burada, viewda logic bulunmaz.
//Logic ler view_modelde yönetilmelidir.

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.purple,
      ),
    );
  }
}
