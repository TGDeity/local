import 'package:cache_state/core/cache/exception/exceptions.dart';
import 'package:cache_state/core/cache/shared_manager.dart';
import 'package:cache_state/core/cache/user_cache_maneger.dart';
import 'package:cache_state/model/user_items.dart';
import 'package:cache_state/model/user_model.dart';
import 'package:cache_state/view/shared_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class SharedViewModel<T extends Widget> extends State<SharedView> {
  @override
  void initState() {
    userItems = UserItems.users;
    sharedManeger = ISharedManeger();
    userManeger = UserCacheManeger();
    initializePrefences();
  
 
     getCachedUserList();

    super.initState();
  }

  void initializePrefences() async {
    await sharedManeger.init();
    await userManeger.init();
  }

  void changeBool() {
    setState(() {
      isBool = !isBool;
    });
  }

  void saveTextUser() {
    if (formKey.currentState!.validate()) {
      UserItems.users.add(
        User(name: nameController.text, description: descriptionController.text, url: urlController.text),
      );
      formKey.currentState!.save();
    } else {
      if (kDebugMode) {
        print(
          SaveStringException(
            'Kayıt edilemedi hata kodu: saveTextUser() fonksiyonunda formKey.currentState!.validate() validate olamadı',
          ),
        );
      }
    }
    setState(() {
      nameController.clear();
      descriptionController.clear();
      urlController.clear();
    });
  }

  userListSave() {
    userManeger.saveStringItems(SharedKeys.users, userItems);
  }


  Future<void> getCachedUserList() async {
    try {
      List<User>? getList = await userManeger.getStringItems();
      for (var element in getList!) {
        userItems.add(element);
      }
      setState(() {
       // cachedItemBool = true;
      });
    } catch (e) {
      setState(() {
       // cachedItemBool = false;
      });
    }
  }

  userRemoveList() {
    userManeger.removeItem(SharedKeys.users);
    setState(() {});
  }

  InputDecoration inputDecoration(String value) => InputDecoration(labelText: value);

  String? validator(String? value) => value!.isEmpty ? 'Boş geçilemez' : null;

  late final ISharedManeger sharedManeger;
  late final IUserCacheManeger userManeger;
  late final List<User> userItems;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBool = false;
  final String nameText = 'name';
  final String descText = 'Açıklama';
  final String urlText = 'Url';
  //late bool cachedItemBool;
}
