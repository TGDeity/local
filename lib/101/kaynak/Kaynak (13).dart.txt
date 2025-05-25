import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 300,
            child: Image.asset(ImageItems().appleWithBoook, fit: BoxFit.contain),
          ),

            SizedBox(
            height: 200,
            width: 100,
            child: NetworkPng(),),

           SizedBox(
            height: 200,
            width: 100,
            child: PngImage(pngPath: "elma"),
          ),
        ],
      ),
    );
  }
}

class ImageItems {
   final String appleWithBoook = "assets/png/elma.png";
}


class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.pngPath});

  final String pngPath;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/png/$pngPath.png', fit: BoxFit.contain);
  }
}

class NetworkPng extends StatelessWidget {
  const NetworkPng({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(_nameWithPath
    ,errorBuilder: (context, error, stackTrace) =>  CircularProgressIndicator() ,);
  }

  String get _nameWithPath => "htts://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png";
}