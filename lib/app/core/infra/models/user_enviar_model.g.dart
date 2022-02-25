// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_enviar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEnviarModel _$UserEnviarModelFromJson(Map<String, dynamic> json) {
  return UserEnviarModel(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserEnviarModelToJson(UserEnviarModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
