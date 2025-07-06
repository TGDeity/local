class SharedNotInitiazleException implements Exception {
  @override
  String toString() {
    return 'shared not initialized';
  }
}

class SaveStringException implements Exception {
  final String message;
  SaveStringException(this.message);
  @override
  String toString() {
    return 'Kayıt edilemedi hata kodu: $message';
  }
}

class RemoveItemException implements Exception {
  final String message;
  RemoveItemException(this.message);
  @override
  String toString() {
    return 'Kayıt silinemedi hata kodu: $message';
  }
}

class GetStringException implements Exception {
  final String message;
  GetStringException(this.message);
  @override
  String toString() {
    return 'Kayıt okunamadı hata kodu: $message';
  }
}
