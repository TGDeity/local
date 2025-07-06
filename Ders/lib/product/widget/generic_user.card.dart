import 'package:ders/303/generic_learn.dart';
import 'package:flutter/material.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({super.key, required this.model});
  final GenericUser model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(model.name),
    );
  }
}