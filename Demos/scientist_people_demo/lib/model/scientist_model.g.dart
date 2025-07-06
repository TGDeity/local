// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scientist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScientistModel _$ScientistModelFromJson(Map<String, dynamic> json) =>
    ScientistModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      quote: json['quote'] as String?,
      field: json['field'] as String?,
      birthYear: (json['birthYear'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScientistModelToJson(ScientistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'quote': instance.quote,
      'field': instance.field,
      'birthYear': instance.birthYear,
    };
