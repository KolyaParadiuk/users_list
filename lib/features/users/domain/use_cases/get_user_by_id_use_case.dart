import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/repository/users_repository.dart';

abstract class GetUserByIdUseCase {
  Future<User> call(int id);
}

class GetUserByIdUseCaseImpl extends GetUserByIdUseCase {
  GetUserByIdUseCaseImpl({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  final UsersRepository _usersRepository;

  @override
  Future<User> call(int id) async => _usersRepository.getUserById(id);
}
