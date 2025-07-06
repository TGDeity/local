import 'package:mobx/mobx.dart';
import 'package:scientist_people_demo/model/scientist_model.dart';
import 'package:scientist_people_demo/service/scientist_service_maneger.dart';
import 'package:scientist_people_demo/service/shared_pref_manager.dart';

part 'list_screen_view_model.g.dart';

class ListScreenViewModel = _ListScreenViewModelBase with _$ListScreenViewModel;

abstract class _ListScreenViewModelBase with Store {
  final ScientistNetworkManager scientistNetworkManager;
  final ISharedPrefManager sharedPrefManager;

  // DÖNGÜSEL BAĞIMLILIK KALDIRILDI
  _ListScreenViewModelBase(this.scientistNetworkManager, this.sharedPrefManager);

  @observable
  List<Map<String, dynamic>>? scientistList = [];

  @action
  Future<void> getListScientists() async {
    try {
      final response = await scientistNetworkManager.fetchItem();
      if (response != null) {
        scientistList = response.map((e) => e.toJson()).toList();
      }
    } catch (e) {
      throw Exception('Failed to fetch scientists: $e');
    }
  }

  @action
  Future<void> deleteScientist(int index) async {
    try {
      var response = await scientistNetworkManager.deleteScientistId(index);
      if (response != null) {
        await getListScientists();
      }
    } catch (e) {
      throw Exception('Failed to delete scientist: $e');
    }
  }

  @action
  Future<void> saveLocalFile(int index, ScientistModel data) async {
  
    await sharedPrefManager.setString('$index', data);
  }
}
