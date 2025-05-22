import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/use_cases/get_user_by_id_use_case.dart';

sealed class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsError extends UserDetailsState {
  UserDetailsError(this.message);
  final String message;
}

class UserDetailsLoaded extends UserDetailsState {
  UserDetailsLoaded(this.user);
  final User user;
}

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit({
    required GetUserByIdUseCase getUserByIdUseCase,
  })  : _getUserByIdUseCase = getUserByIdUseCase,
        super(UserDetailsInitial());

  final GetUserByIdUseCase _getUserByIdUseCase;

  Future<void> init(int userId) async {
    try {
      emit(UserDetailsInitial());
      final user = await _getUserByIdUseCase(userId);
      emit(UserDetailsLoaded(user));
    } catch (e) {
      emit(UserDetailsError(e.toString()));
    }
  }
}
