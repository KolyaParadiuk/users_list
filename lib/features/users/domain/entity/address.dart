import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.country,
  });
  final String country;

  @override
  List<Object?> get props => [country];
}
