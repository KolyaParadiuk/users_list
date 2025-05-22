import 'package:json_annotation/json_annotation.dart';

part 'bank_dto.g.dart';

@JsonSerializable(createToJson: false)
class BankDto {
  const BankDto({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory BankDto.fromJson(Map<String, dynamic> json) =>
      _$BankDtoFromJson(json);

  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;
}
