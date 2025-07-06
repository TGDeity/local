enum ScientistNetworkPath { scientists }
extension ScientistNetworkPathExtension on ScientistNetworkPath {
  String get networkPath {
    switch (this) {
      case ScientistNetworkPath.scientists:
        return '/scientists';
    }
  }
}

enum ScientistModeldataType{
  id,
  name,
  image,
  quote,
  field,
  birthYear
}

extension ScientistModeldataTypeExtension on ScientistModeldataType{
  String get dataType{
    switch (this) {
      case ScientistModeldataType.id:
        return 'id';
      case ScientistModeldataType.name:
        return 'name';
      case ScientistModeldataType.image:
        return 'image';
      case ScientistModeldataType.quote:
        return 'quote';
      case ScientistModeldataType.field:
        return 'field';
      case ScientistModeldataType.birthYear:
        return 'birthYear';
    }
  }
}