import 'package:cadastroprodutos/app/core/domain/entities/itens_enviar_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itens_enviar_model.g.dart';

@JsonSerializable()
class ItensEnviarModel extends ItensEnviarEntity {
  ItensEnviarModel({
    required String title,
    required String description,
  }) : super(title: title, description: description);

  factory ItensEnviarModel.fromJson(Map<String, dynamic> json) => _$ItensEnviarModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItensEnviarModelToJson(this);

  factory ItensEnviarModel.fromUserEntity(ItensEnviarEntity itensEnviarEntity) => ItensEnviarModel(
        title: itensEnviarEntity.title,
        description: itensEnviarEntity.description,
      );

  ItensEnviarEntity toUserAuthenticateEntity() => ItensEnviarEntity(
        title: title,
        description: description,
      );
}
