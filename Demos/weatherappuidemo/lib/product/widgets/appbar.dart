import 'package:flutter/material.dart';


class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Weather App'),
      backgroundColor: Colors.transparent,
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}