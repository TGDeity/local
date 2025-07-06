import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({super.key});
  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  int _resullt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final resullt = await compute(CalculatorCompute.sum, 1000000000000); //! YENİ BİR Threat oluşturdu. Genelde JsonDecode JsonEncode gibi threatları buraya atmalıyız.
          setState(() {
            _resullt = resullt;
          });
        },
      ),
      appBar: AppBar(title: Text(_resullt.toString())),
      body: Column(children: []),
    );
  }
}

class CalculatorCompute {
  static int sum(int limit) {
    // ! Mutlaka static olmalı.
    int resut = 0;
    for (var i = 0; i < limit;) {
      return resut = i * i;
    }
    return resut;
  }
}
