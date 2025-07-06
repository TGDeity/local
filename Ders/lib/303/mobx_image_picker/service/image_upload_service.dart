
import 'dart:io';
import 'dart:typed_data';

import 'package:ders/303/mobx_image_picker/model/image_upload_response.model.dart';
import 'package:dio/dio.dart';

class ImageUploadService {
  ImageUploadService(this.dio);
  final Dio dio;
  //https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  //https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fvb.png

 Future<ImageUploadResponse?> uploadToImageServer (Uint8List byteArray, String name,{void Function(int, int)? onSendProgress}) async{
    var formData = FormData.fromMap(
      {
        "file": MultipartFile.fromBytes(byteArray)
      }
    );

   final response = await dio.post('full%2F$name.png', data: formData,onSendProgress: onSendProgress);


  if (response.statusCode == HttpStatus.ok) {
    
    return ImageUploadResponse.fromJson(response.data);
  }
  return null;

  }

}