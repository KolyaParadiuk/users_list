import 'package:users_list/features/users/domain/entity/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers({
    int? skip,
  });

  Future<User> getUserById(int id);
}
