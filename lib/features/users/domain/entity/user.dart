import 'package:equatable/equatable.dart';
import 'package:users_list/features/users/domain/entity/address.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.address,
    required this.birthDate,
    this.maidenName,
    this.image,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String? maidenName;
  final int age;
  final Address address;
  final String birthDate;
  final String? image;

  @override
  List<Object?> get props => [id, firstName, lastName];

  String get fullName => '$firstName $maidenName $lastName';
}
