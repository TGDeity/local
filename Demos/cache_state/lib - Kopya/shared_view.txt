import 'package:cache_state/view/shared_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SharedView extends StatefulWidget {
  const SharedView({super.key});

  @override
  State<SharedView> createState() => _SharedViewState();
}

class _SharedViewState extends SharedViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButtons(),
      appBar: AppBar(title: const Text('Shared View')),
      body: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: userItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(true ? (userItems[index].name.toString()) : ''),
                          //subtitle: Text(userItems[index].description ?? ''),
                          //trailing: Text(userItems[index].url ?? ''),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: validator,
                  autofocus: true,
                  decoration: inputDecoration(nameText),
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: validator,
                  decoration: inputDecoration(descText),
                ),
                TextFormField(controller: urlController, validator: validator, decoration: inputDecoration(urlText)),
                isBool
                    ? ElevatedButton(onPressed: () {}, child: Text('Kayıt başarılı'))
                    : ElevatedButton(onPressed: saveTextUser, child: Text('Kaydet')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _floatingActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            userListSave();
            if (kDebugMode) {
              print(userItems.length);
            }
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.show_chart),
          onPressed: () {
            getCachedUserList();
          },
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              userRemoveList();
            });
          },
        ),
      ],
    );
  }
}
