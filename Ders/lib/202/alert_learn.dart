import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final respnse = await showDialog(
            context: context,
            builder: (context) {
              return const _ImageZoomDialog();
            });
      }),
      appBar: AppBar(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version update!'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Update2'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'))
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
      : super(
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Update2'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
