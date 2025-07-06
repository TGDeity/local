import 'dart:convert';

import 'package:scientist_people_demo/model/scientist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPrefManager {
  Future<void> setString(String key, ScientistModel value);
  String? getString(String key);
}

class SharedPrefManager implements ISharedPrefManager {
  late final SharedPreferences prefs;

  SharedPrefManager() {
    getInstance();
  }

  Future<void> getInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) {
    List<String>? response = [];
    String? value = prefs.getString(key);


    response.map((e) {
      final json = jsonDecode(e);

      if (json is Map<String, dynamic>) {
        return ScientistModel.fromJson(json);
      }
    });

    return null;
  }

  @override
  Future<void> setString(String key, ScientistModel value) async {
    List<ScientistModel> list = [];
    list.add(value);
    list.map((e) => e.toJson()).toList();
    await prefs.setString(key, list.map((e) => e.toJson()).toList().toString());
  }
}
