import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();

    _items = CollectionsItems().items;
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _PaddingUtility().paddingHorizontalPadding,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
        itemCount: _items.length,
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _PaddingUtility().paddingBottom,
      child: Padding(
        padding:  _PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            Image.asset(_model.imagePath, fit: BoxFit.fill, width: 300),
            Padding(
              padding: _PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(_model.title), Text('${_model.price} eth')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class CollectionsItems {
  late final List<CollectionModel> items;
  CollectionsItems(){
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstract Art", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstract Art 2", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstract Art 3", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: "Abstract Art 4", price: 3.4),
    ];
  }
}

class _PaddingUtility {

  final paddingTop = const EdgeInsets.only(top: 10.0);
  final paddingBottom =const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.symmetric(horizontal: 20);
  final paddingHorizontalPadding =EdgeInsets.symmetric(horizontal: 20);
  
}

class ProjectImages {
  static const imageCollection ='assets/png/image_demo_collection_resim_1.png';
}