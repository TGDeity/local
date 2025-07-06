import 'package:flutter/material.dart';

class NaviagteHomeDetail extends StatefulWidget {
  const NaviagteHomeDetail({super.key, this.id});
  final String? id;

  @override
  State<NaviagteHomeDetail> createState() => _NaviagteHomeDetailState();
}

class _NaviagteHomeDetailState extends State<NaviagteHomeDetail> {
  String? _id;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // TODO Future.microtask ekran initState'i bitmesini bekle akabinde call et diyoruz. Çünkü ModalRoute initState anında çizilemiyor bu nedenle bekliyoruz.
      if (!mounted) return;
      final modelId = ModalRoute.of(context)?.settings.arguments;
      print(modelId);
      setState(() {
        _id = modelId is String ? modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(_id ?? 'idNull')));
  }
}
