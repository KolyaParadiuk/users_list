import 'package:json_annotation/json_annotation.dart';
import 'package:users_list/common/network/dto/address_dto.dart';

part 'company_dto.g.dart';

@JsonSerializable(createToJson: false)
class CompanyDto {
  const CompanyDto({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);

  final String department;
  final String name;
  final String title;
  final AddressDto address;
}
