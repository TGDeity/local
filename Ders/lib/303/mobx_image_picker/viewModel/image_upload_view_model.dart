import 'dart:io';

import 'package:ders/303/mobx_image_picker/model/image_upload_response.model.dart';
import 'package:ders/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const _baseUrl = 'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com';

  @observable
  String imageUrl = '';

  @observable
  File? file;
  ImageUploadService imageUploadService = ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  @observable //Ekranda dinlemek istiyorsak
  bool isLoading = true;

  @observable
  String downloadTexr = '';

  @action
  updateDownloadText(int send, int total) {
    downloadTexr = '$send / $total';
  }

    @action
  uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl = '${response.name}';
  }

  @action //ekrana haber verecekse
  void changeLoading() {
    isLoading = !isLoading;
  }

  void init() {}
  @action
  saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

 Future<void> saveDataToService() async {
    if (file == null) return;
    changeLoading();
    final responsex = imageUploadService.uploadToImageServer(
      await file!.readAsBytes(),
      'tga',
      onSendProgress: (sent, total) {
        updateDownloadText(sent, total);
      },
      
    );

   uploadImageUrl(await responsex);
   
  }

  

}
