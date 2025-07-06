



import 'package:ders/202/cache/old/shared_maneger.dart';
import 'package:flutter/material.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;
  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialze();
  }

  Future<void> _initialze() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final value0 = int.tryParse(value);
    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentValue.toString()), actions: [_loading(context)]),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [_saveValueButton(), _removeValueButton()]),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),

          Expanded(child: _UserListView()),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor))
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: (() async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      }),
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: (() async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      }),
      child: const Icon(Icons.remove),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView();

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name, style: Theme.of(context).textTheme.headlineLarge),
            subtitle: Text(users[index].description),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [User('vb', '10', 'vb10.dev'), User('vb2', '102', 'vb10.dev'), User('vb3', '103', 'vb10.dev')];

   // users.map((element)=> jsonEncode(element.toJson())).toList())
  

 
  }
}

class User {
  final String name;
  final String description;
  final String url;
  User(this.name, this.description, this.url);
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
