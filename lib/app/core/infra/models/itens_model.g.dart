// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItensModel _$ItensModelFromJson(Map<String, dynamic> json) {
  return ItensModel(
    id: json['id'] as int?,
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ItensModelToJson(ItensModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
