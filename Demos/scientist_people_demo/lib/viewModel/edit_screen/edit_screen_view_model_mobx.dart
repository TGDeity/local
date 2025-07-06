import 'package:mobx/mobx.dart';
import 'package:scientist_people_demo/Product/constatns.dart';
import 'package:scientist_people_demo/service/scientist_service_maneger.dart';

part 'edit_screen_view_model_mobx.g.dart';

class EditScreenViewModel = _EditScreenViewModelBase with _$EditScreenViewModel;

abstract class _EditScreenViewModelBase with Store {
  @observable
  Map<String, dynamic> formData = {};

  @action
  void updateFormData(Map<String, dynamic> data) {
    formData = data;
  }

  @action
  Map<String, dynamic> getFormData() {
    return formData;
  }

  @action
  void updateScientistData(String name, String image, String quote, String field, int birthYear) {
    ScientistNetworkManager scientistNetworkManager = ScientistNetworkManager();
    scientistNetworkManager.dio.put(
      '${ScientistNetworkPath.scientists.networkPath}/${formData[ScientistModeldataType.id.dataType]}',
      data: {'name': name, 'image': image, 'quote': quote, 'field': field, 'birthYear': birthYear},

      

    );
  }

  
}
