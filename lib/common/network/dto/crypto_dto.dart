import 'package:json_annotation/json_annotation.dart';

part 'crypto_dto.g.dart';

@JsonSerializable(createToJson: false)
class CryptoDto {
  const CryptoDto({
    required this.coin,
    required this.wallet,
    required this.network,
  });
  factory CryptoDto.fromJson(Map<String, dynamic> json) =>
      _$CryptoDtoFromJson(json);

  final String coin;
  final String wallet;
  final String network;
}
