

import 'package:ders/product/global/resource_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(appBar: AppBar(
      actions: [IconButton(onPressed: (){
        context.read<ResourceContext>().clear();
      }, icon: Icon(Icons.remove))],
      title: Text(context.read<ResourceContext>().model?.data?[0].name ?? ''),
    ), body: Column(
      children: [
        ImagePathsEnum.elma.toWidget(height: 400),
        
      ],
    ));
  }
}

enum ImagePathsEnum { elma }

extension ImagePathExtension on ImagePathsEnum {
  path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(path(), height: height);
  }
}
