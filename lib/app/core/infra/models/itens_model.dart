import 'package:cadastroprodutos/app/core/domain/entities/itens_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itens_model.g.dart';

@JsonSerializable()
class ItensModel extends ItensEntity {
  ItensModel({
    int? id,
    required String title,
    required String description,
  }) : super(
          id: id,
          title: title,
          description: description,
        );

  factory ItensModel.fromJson(Map<String, dynamic> json) => _$ItensModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItensModelToJson(this);

    factory ItensModel.fromUserEntity(ItensEntity itensEntity) => ItensModel(
        id: itensEntity.id,
        title: itensEntity.title,
        description: itensEntity.description,
      );
  
}
