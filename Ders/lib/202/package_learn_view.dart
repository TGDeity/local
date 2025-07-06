import 'package:ders/202/package/launch_mixin.dart';
import 'package:flutter/material.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
        onPressed: () {
          launchUrl_(Uri(scheme: 'https', host: 'www.pub.dev'));
        },
      ),
      body: Text(''),
    );
  }

  @override
  void name(args) {
    print(args);
  }
}
