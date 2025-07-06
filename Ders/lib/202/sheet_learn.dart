import 'dart:developer';

import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backGroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent, // açıldıktan sonra arka plan rengi
            backgroundColor: _backGroundColor,
            isScrollControlled:
                true, // fullScreen açılmasını sağlar. Ancak  öncesinde SizedBoxla çerçeveleyerek ekran yüksekiğini yine ayarlayabiliriz.
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) => _CustomSheetBottom(backgroundColor: _backGroundColor),
          );

          inspect(result);
          if (result is bool) {
            setState(() {
              _backGroundColor = Colors.purple;
            });
          }
        },
        child: Icon(Icons.abc, color: _backGroundColor),
      ),
      
    );
  }
}

class _CustomSheetBottom extends StatefulWidget {
  const _CustomSheetBottom({required backgroundColor});

  @override
  State<_CustomSheetBottom> createState() => _CustomSheetBottomState();
}

class _CustomSheetBottomState extends State<_CustomSheetBottom> {
  Color _backGroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backGroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // içerisindeki elemanların kapaladığı alan kadar alan kapla.
          children: [
            Divider(color: Colors.red,thickness: 3,indent:200,),
            Image.network("https://picsum.photos/200", height: 200, width: double.infinity),
            Text('data'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _backGroundColor = Colors.red;
                });
                Navigator.of(context).pop<bool>(true);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
