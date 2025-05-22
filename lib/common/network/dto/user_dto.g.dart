// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      maidenName: json['maidenName'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      birthDate: json['birthDate'] as String,
      image: json['image'] as String,
      bloodGroup: json['bloodGroup'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      eyeColor: json['eyeColor'] as String,
      hair: HairDto.fromJson(json['hair'] as Map<String, dynamic>),
      ip: json['ip'] as String,
      address: AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String,
      university: json['university'] as String,
      bank: BankDto.fromJson(json['bank'] as Map<String, dynamic>),
      company: CompanyDto.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String,
      ssn: json['ssn'] as String,
      userAgent: json['userAgent'] as String,
      crypto: CryptoDto.fromJson(json['crypto'] as Map<String, dynamic>),
      role: json['role'] as String,
    );
