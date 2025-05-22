part of 'api.dart';

@RestApi()
abstract class UsersApi {
  factory UsersApi(Dio dio) = _UsersApi;

  @GET('/users')
  Future<GetUsersResponse> getUsers({
    @Query('limit') int limit = 20,
    @Query('skip') int skip = 0,
  });

  @GET('/users/{id}')
  Future<UserDto> getUserById(
    @Path('id') int id,
  );
}
