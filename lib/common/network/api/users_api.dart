part of 'api.dart';

abstract class UsersApi {
  Future<GetUsersResponse> getUsers({
    int limit,
    int skip,
  });

  Future<UserDto> getUserById(int id);
}

@RestApi()
abstract class UsersApiV1 implements UsersApi {
  factory UsersApiV1(Dio dio) = _UsersApiV1;

  @override
  @GET('/users')
  Future<GetUsersResponse> getUsers({
    @Query('limit') int limit = 20,
    @Query('skip') int skip = 0,
  });

  @override
  @GET('/users/{id}')
  Future<UserDto> getUserById(
    @Path('id') int id,
  );
}

class UsersApiV2 implements UsersApi {
  UsersApiV2(this.dio);

  final Dio dio;

  @override
  Future<GetUsersResponse> getUsers({
    int limit = 20,
    int skip = 0,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/users',
      queryParameters: {
        'limit': limit,
        'skip': skip,
      },
    );
    if (response.data case final Map<String, dynamic> data) {
      return GetUsersResponse.fromJson(data);
    }
    throw Exception('Failed to load users');
  }

  @override
  Future<UserDto> getUserById(int id) async {
    final response = await dio.get<Map<String, dynamic>>('/users/$id');
    if (response.data case final Map<String, dynamic> data) {
      return UserDto.fromJson(data);
    }
    throw Exception('Failed to load user');
  }
}
