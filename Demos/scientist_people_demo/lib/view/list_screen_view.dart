import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';

import 'package:scientist_people_demo/Product/constatns.dart';
import 'package:scientist_people_demo/service/scientist_service_maneger.dart';
import 'package:scientist_people_demo/viewModel/list_screen/list_screen_view_state.dart';

class ListScreenView extends StatefulWidget {
  const ListScreenView({super.key});

  @override
  State<ListScreenView> createState() => _ListScreenViewState();
}

class _ListScreenViewState extends LisScreenViewState<ListScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          screenViewModel.getListScientists();
          final response = screenViewModel.sharedPrefManager.getString('7');

          showModalBottomSheet(
            context: context,
            builder: (context) => Card(
              child: Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                ],
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text('List Screen'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return _cardWidget(index);
            },
            itemCount: screenViewModel.scientistList?.length ?? 1,
          );
        },
      ),
    );
  }

  Card _cardWidget(int index) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(
              screenViewModel.scientistList?[index][ScientistModeldataType.image.dataType],
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: SizedBox(child: cardWidgetMethods.descriptionCardField(index))),
              IconButton(
                onPressed: () => cardWidgetMethods.deleteCardButton(index),
                icon: const Icon(Icons.delete_forever_outlined),
              ),
              IconButton(
                onPressed: () => cardWidgetMethods.editCardButton(index),
                icon: const Icon(Icons.edit_document),
              ),
              IconButton(
                onPressed: () {
                  saveToLocalFile(
                    index,
                    ScientistNetworkManager().toScientistModel(screenViewModel.scientistList?[index]),
                  );
                },
                icon: const Icon(Icons.save_alt_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
