import 'package:users_list/common/network/api/api.dart';
import 'package:users_list/di.dart';
import 'package:users_list/features/users/data/data_sources/users_data_source.dart';
import 'package:users_list/features/users/data/repository/users_repository.dart';
import 'package:users_list/features/users/domain/repository/users_repository.dart';
import 'package:users_list/features/users/domain/use_cases/get_user_by_id_use_case.dart';
import 'package:users_list/features/users/domain/use_cases/get_users_use_case.dart';
import 'package:users_list/features/users/presentation/user_details/user_details_cubit.dart';
import 'package:users_list/features/users/presentation/users_list/user_list_cubit.dart';

class UserFeatureDependencyResolver {
  static void resolve() {
    _data();
    _domain();
    _presentation();
  }

  static void _data() {
    di
      ..registerSingleton<UsersDataSource>(
        UsersDataSourceImpl(
          usersApi: di.get<UsersApi>(),
        ),
      )
      ..registerSingleton<UsersRepository>(
        UsersRepositoryImpl(
          usersDataSource: di.get<UsersDataSource>(),
        ),
      );
  }

  static void _domain() {
    di
      ..registerSingleton<GetUsersUseCase>(
        GetUsersUseCaseImpl(
          usersRepository: di.get<UsersRepository>(),
        ),
      )
      ..registerSingleton<GetUserByIdUseCase>(
        GetUserByIdUseCaseImpl(
          usersRepository: di.get<UsersRepository>(),
        ),
      );
  }

  static void _presentation() {
    di
      ..registerFactory<UserListCubit>(
        () => UserListCubit(
          getUsersUseCase: di.get<GetUsersUseCase>(),
        ),
      )
      ..registerFactory<UserDetailsCubit>(
        () => UserDetailsCubit(
          getUserByIdUseCase: di.get<GetUserByIdUseCase>(),
        ),
      );
  }
}
