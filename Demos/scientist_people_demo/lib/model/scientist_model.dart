import 'package:json_annotation/json_annotation.dart';
part 'scientist_model.g.dart';

@JsonSerializable()
class ScientistModel {
  int? id;
  String? name;
  String? image;
  String? quote;
  String? field;
  int? birthYear;

  ScientistModel({
    this.id,
    this.name,
    this.image,
    this.quote,
    this.field,
    this.birthYear,
  });

  factory ScientistModel.fromJson(Map<String, dynamic> json) =>
      _$ScientistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScientistModelToJson(this);

  ScientistModel copyWith({
    int? id,
    String? name,
    String? image,
    String? quote,
    String? field,
    int? birthYear,
  }) {
    return ScientistModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      quote: quote ?? this.quote,
      field: field ?? this.field,
      birthYear: birthYear ?? this.birthYear,
    );
  }
}
