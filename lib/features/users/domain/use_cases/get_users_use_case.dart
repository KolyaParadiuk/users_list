import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/repository/users_repository.dart';

abstract class GetUsersUseCase {
  Future<List<User>> call({
    int? skip,
  });
}

class GetUsersUseCaseImpl extends GetUsersUseCase {
  GetUsersUseCaseImpl({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  final UsersRepository _usersRepository;

  @override
  Future<List<User>> call({
    int? skip,
  }) async {
    return _usersRepository.getUsers(
      skip: skip,
    );
  }
}
