import 'package:json_annotation/json_annotation.dart';
import 'package:users_list/common/network/dto/coordinates_dto.dart';

part 'address_dto.g.dart';

@JsonSerializable(createToJson: false)
class AddressDto {
  const AddressDto({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final CoordinatesDto coordinates;
  final String country;
}
