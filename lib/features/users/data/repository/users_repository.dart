import 'package:users_list/features/users/data/data_sources/users_data_source.dart';
import 'package:users_list/features/users/data/repository/mappers_extensions.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required UsersDataSource usersDataSource,
  }) : _usersDataSource = usersDataSource;

  final UsersDataSource _usersDataSource;

  @override
  Future<List<User>> getUsers({
    int? skip,
  }) async {
    final response = await _usersDataSource.getUsers(
      skip: skip,
    );
    return response.map((e) => e.toEntity()).toList();
  }

  @override
  Future<User> getUserById(int id) async {
    final response = await _usersDataSource.getUserById(id);
    return response.toEntity();
  }
}
