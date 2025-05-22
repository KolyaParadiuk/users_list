import 'package:json_annotation/json_annotation.dart';
import 'package:users_list/common/network/dto/user_dto.dart';

part 'get_users_response.g.dart';

@JsonSerializable(createToJson: false)
class GetUsersResponse {
  GetUsersResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);

  final List<UserDto> users;
  final int total;
  final int skip;
  final int limit;
}
