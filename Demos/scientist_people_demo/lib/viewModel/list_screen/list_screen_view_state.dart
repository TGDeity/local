import 'package:flutter/material.dart';
import 'package:scientist_people_demo/Product/constatns.dart';
import 'package:scientist_people_demo/model/scientist_model.dart';
import 'package:scientist_people_demo/service/scientist_service_maneger.dart';
import 'package:scientist_people_demo/service/shared_pref_manager.dart';
import 'package:scientist_people_demo/viewModel/list_screen/list_screen_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LisScreenViewState<T extends StatefulWidget> extends State<T> {
  late final ListScreenViewModel screenViewModel;
  late final CardWidgetMethods cardWidgetMethods;
  late final SharedPrefManager sharedManager;


  @override
  void initState() {
    super.initState();
    // Dependency Injection ile oluşturuluyor
    final networkManager = ScientistNetworkManager();
    sharedManager = SharedPrefManager();
    screenViewModel = ListScreenViewModel(networkManager,sharedManager);
    screenViewModel.getListScientists();
    cardWidgetMethods = CardWidgetMethods(screenViewModel, context);
  }



  void saveToLocalFile(int index, ScientistModel data) {
    
    screenViewModel.saveLocalFile(index, data);
  }

}

class CardWidgetMethods {
  final ListScreenViewModel screenViewModel;
  final BuildContext context;

  CardWidgetMethods(this.screenViewModel, this.context);

  Column descriptionCardField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quete ${screenViewModel.scientistList?[index][ScientistModeldataType.quote.dataType] ?? ''}'),
        Text('Alan: ${screenViewModel.scientistList?[index][ScientistModeldataType.field.dataType] ?? ''}'),
        Text('Ad: ${screenViewModel.scientistList?[index][ScientistModeldataType.name.dataType] ?? ''}'),
        Text('BirhDate: ${screenViewModel.scientistList?[index][ScientistModeldataType.birthYear.dataType] ?? ''}'),
      ],
    );
  }

    void editCardButton(int index) {
    Navigator.pushNamed(context, '/edit', arguments: screenViewModel.scientistList?[index]).then((updateData) {
      if (updateData != null && updateData == true) {
        screenViewModel.getListScientists();
      } else {}
    });
  }

  void deleteCardButton(int index) {
    screenViewModel.deleteScientist(screenViewModel.scientistList?[index][ScientistModeldataType.id.dataType] ?? '');
  }
}
