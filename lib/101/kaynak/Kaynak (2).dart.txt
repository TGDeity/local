import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({super.key,this.height = 100});
    final imageUrl = 'https://picsum.photos/200/300?grayscale';
    final double height;
  @override
  Widget build(BuildContext context) {
    return  Image.network(imageUrl,height: height,fit: BoxFit.cover,);
  }
}