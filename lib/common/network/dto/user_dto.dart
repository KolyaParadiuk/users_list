import 'package:json_annotation/json_annotation.dart';
import 'package:users_list/common/network/dto/address_dto.dart';
import 'package:users_list/common/network/dto/bank_dto.dart';
import 'package:users_list/common/network/dto/company_dto.dart';
import 'package:users_list/common/network/dto/crypto_dto.dart';
import 'package:users_list/common/network/dto/hair_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable(createToJson: false)
class UserDto {
  const UserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final HairDto hair;
  final String ip;
  final AddressDto address;
  final String macAddress;
  final String university;
  final BankDto bank;
  final CompanyDto company;
  final String ein;
  final String ssn;
  final String userAgent;
  final CryptoDto crypto;
  final String role;
}
