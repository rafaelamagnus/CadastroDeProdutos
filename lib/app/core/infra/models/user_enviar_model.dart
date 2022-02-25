import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_enviar_model.g.dart';

@JsonSerializable()
class UserEnviarModel extends UserEnviarEntity {
  const UserEnviarModel({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  factory UserEnviarModel.fromJson(Map<String, dynamic> json) => _$UserEnviarModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserEnviarModelToJson(this);

  factory UserEnviarModel.fromUserEntity(UserEnviarEntity userAuthenticateEntity) =>
      UserEnviarModel(
        email: userAuthenticateEntity.email,
        password: userAuthenticateEntity.password,
      );

  UserEnviarEntity toUserAuthenticateEntity() => UserEnviarEntity(
        email: email,
        password: password,
      );
}
