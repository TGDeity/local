import 'dart:io';

import 'package:ders/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  //iş yapacak katmanın iskeletini oluştur.
  bool? downloadItem(FileItem? item);

  void toShare(String path) async {
    if (!await launchUrl(Uri(path: path))) {}
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  //extends'in implementsten farkı üst sınıfın tüm özelliklerini kabul et ama sadece istediğimiz özellikleri override et
  @override
  bool? downloadItem(FileItem? item) {
    item == null ? throw FileDownloadCustomException() : print('FileDownload kbak');
    return true;
  }
  /* extends nedeni ile toShare vermesekte oluyotr.
  @override
  void toShare(String path) {}
  */

  void smsShare() {}
}

class SMSDownload implements IFileDownload {
  //extends'in implementsten farkı üst sınıfın tüm özelliklerini kabul et ama sadece istediğimiz özellikleri override et
  @override
  bool? downloadItem(FileItem? item) {
    item == null ? throw FileDownloadCustomException() : print('FileDownload kbak');
    return true;
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl(Uri(path: 'sms: $path'));
  }
}

class FileItem {
  final File file;
  final String name;

  FileItem(this.file, this.name);
}

mixin ShareMixin on IFileDownload {
  //on ile sadece IFileDownlaodttan extends olanlar için kullan ile sınırladık, implementste mixin eklenemez çünkü sadece extende eklenebilir implementsler sınıfları direkt kalıttığı için değişikliğe izin vermiyor.
  void toShowFile() {}
}
