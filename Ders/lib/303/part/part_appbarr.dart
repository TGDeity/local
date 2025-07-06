

//import 'package:flutter/material.dart';

part of 'part_of_learn.dart';

class PartofAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PartofAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(actions: [Icon(Icons.abc_outlined)]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
