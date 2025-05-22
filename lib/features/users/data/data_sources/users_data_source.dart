import 'package:users_list/common/network/api/api.dart';
import 'package:users_list/common/network/dto/user_dto.dart';

abstract class UsersDataSource {
  Future<List<UserDto>> getUsers({
    int? skip,
  });

  Future<UserDto> getUserById(int id);
}

class UsersDataSourceImpl implements UsersDataSource {
  UsersDataSourceImpl({
    required UsersApi usersApi,
  }) : _usersApi = usersApi;

  final UsersApi _usersApi;

  @override
  Future<List<UserDto>> getUsers({
    int? skip,
  }) async {
    final response = await _usersApi.getUsers(
      skip: skip ?? 0,
    );
    return response.users;
  }

  @override
  Future<UserDto> getUserById(int id) async {
    final response = await _usersApi.getUserById(id);
    return response;
  }
}
