import 'package:users_list/common/network/dto/address_dto.dart';
import 'package:users_list/common/network/dto/user_dto.dart';
import 'package:users_list/features/users/domain/entity/address.dart';
import 'package:users_list/features/users/domain/entity/user.dart';

extension UserDtoX on UserDto {
  User toEntity() => User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        maidenName: maidenName,
        age: age,
        address: address.toEntity(),
        birthDate: birthDate,
      );
}

extension AddressDtoX on AddressDto {
  Address toEntity() => Address(
        country: country,
      );
}
