import 'package:ders/303/mobx_image_picker/product/utility/image_upload.dart';
import 'package:ders/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:ders/product/global/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  String lottieUploadImgPath = 'https://lottie.host/f8097a6b-7d8c-4d63-8181-29b2949e7a8a/K29EsO3FKL.json';
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManeger = ImageUploadManeger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeNotifier>().changeTheme();
        },
      ),
      appBar: AppBar(
        title: Text('Image Upload'),
        actions: [
          Observer(
            builder: (_) {
              return _imageUploadViewModel.isLoading ? CircularProgressIndicator() : SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10,
              child: FittedBox(
                child: IconButton(
                  onPressed: () async {
                    _imageUploadViewModel.saveLocalFile( await _imageUploadManeger.fetchFromLibrary());
                  },

                  icon: Lottie.network(lottieUploadImgPath),
                ),
              ),
            ),
          ),

          Divider(),
          Expanded(
            flex: 4,
            child: Observer(
              builder: (context) =>
                  _imageUploadViewModel.file != null ? Image.file(_imageUploadViewModel.file!) : Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
