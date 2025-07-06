extension ColorStringExtension on String? {
    int get colorValue {
    String newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.parse(newColor);
  }
}