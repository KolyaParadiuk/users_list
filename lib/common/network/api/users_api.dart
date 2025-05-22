part of 'api.dart';

@RestApi()
abstract class UsersApi {
  factory UsersApi(Dio dio) = _UsersApi;

  @GET('/users')
  Future<List<UserDto>> getUsers();
}
