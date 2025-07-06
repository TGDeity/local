import 'package:image_picker/image_picker.dart';

//TODO image_cropper de eklenebiliyor bu kütüphanye. pubdevden bakılabilir.

class ImageUploadManeger {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> fetchFromLibrary() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

}