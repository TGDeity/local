class FileDownloadCustomException implements Exception { //implements => başka bir clası doğrudan copy etme bütün metotlarını almak.

    @override
  String toString() {
    
    return 'File download has been failed! TG';
  }

}