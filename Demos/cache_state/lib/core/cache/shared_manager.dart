import 'package:cache_state/core/cache/exception/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

abstract class IISharedManegerAbstract {
  Future<void> init();
  Future<void> saveString(SharedKeys key, String value);
  Future<bool> saveStringItems(SharedKeys key, List<String> value);
  String? getString(SharedKeys key);
  List<String>? getStringList(SharedKeys key);
  Future<bool> removeItem(SharedKeys key);
}

class ISharedManeger implements IISharedManegerAbstract {
  SharedPreferences? preferences;
  //ISharedManeger();
  @override
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() {
    if (preferences == null) throw SharedNotInitiazleException();
  }

  //Stringleri key değerleri ile kayıt edebiliriz.
  @override
  Future<void> saveString(SharedKeys key, String value) async {
    try {
      _checkPrefences();
      await preferences?.setString(key.name, value);
    } catch (e) {
      throw SaveStringException(e.toString());
    }
  }

  @override
  Future<bool> saveStringItems(SharedKeys key, List<String> value) async {
    try {
      _checkPrefences();
      await preferences?.setStringList(key.name, value);
      return true;
    } on Exception catch (e) {
      throw SaveStringException(e.toString());
    }
  }

  @override
  List<String>? getStringList(SharedKeys key) {
    try {
      _checkPrefences();
      return preferences?.getStringList(key.name) ?? [];
    } catch (e) {
      throw GetStringException(e.toString());
    }
  }

  @override
  Future<bool> removeItem(SharedKeys key) async {
    try {
      _checkPrefences();
      return (await preferences?.remove(key.name)) ?? false;
    } catch (e) {
      throw RemoveItemException(e.toString());
    }
  }

  @override
  String? getString(SharedKeys key) {
    try {
      _checkPrefences();
      return preferences?.getString(key.name) ?? '';
    } catch (e) {
      throw GetStringException(e.toString());
    }
  }
}
