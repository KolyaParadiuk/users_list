import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable(createToJson: false)
class CoordinatesDto {
  const CoordinatesDto({
    required this.lat,
    required this.lng,
  });

  factory CoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDtoFromJson(json);

  final double lat;
  final double lng;
}
