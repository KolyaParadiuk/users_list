import 'package:json_annotation/json_annotation.dart';

part 'hair_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class HairDto {
  const HairDto({
    required this.color,
    required this.type,
  });

  factory HairDto.fromJson(Map<String, dynamic> json) =>
      _$HairDtoFromJson(json);

  final String color;
  final String type;
}
