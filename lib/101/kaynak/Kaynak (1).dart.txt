import 'package:ders/101/image_learn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotDemosView extends StatelessWidget {
  const NotDemosView({super.key});
  final _title = "Create your first note";
  final _description = "Add a note";
  final _createNote = 'Create a note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark),
      body: Padding(
        padding: PaddingItems.pagePaddinghorizontal,
        child: Column(
          children: [
            PngImage(pngPath: _ImageItems().appleWithBoook),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.pagePaddinghorizontal + PaddingItems.pagePaddingvertical,
              child: _SubTitleWidget(textAlign: TextAlign.center, descrition: _description),
            ),
            Spacer(),

            _CreateButton(createNote: _createNote),
            TextButton(onPressed: () {}, child: Text(_importNotes)),
            const SizedBox(height: ButtonHeight.buttonNormalHeight),
          ],
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({required String createNote}) : _createNote = createNote;

  final String _createNote;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeight.buttonNormalHeight,
        child: Center(child: Text(_createNote, style: Theme.of(context).textTheme.titleMedium)),
      ),
    );
  }
}

class ButtonHeight {
  static const double buttonNormalHeight = 50.0;
}

//Centered text Widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({this.textAlign = TextAlign.center, required this.descrition});
  final TextAlign textAlign;
  final String descrition;
  @override
  Widget build(BuildContext context) {
    return Text(
      descrition * 8,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
    );
  }
}

class PaddingItems {
  static final EdgeInsets pagePaddinghorizontal = const EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets pagePaddingvertical = const EdgeInsets.symmetric(vertical: 10);
}

class _ImageItems {
  final String appleWithBoook = "elma";
}
