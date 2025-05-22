// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      stateCode: json['stateCode'] as String,
      postalCode: json['postalCode'] as String,
      coordinates:
          CoordinatesDto.fromJson(json['coordinates'] as Map<String, dynamic>),
      country: json['country'] as String,
    );
