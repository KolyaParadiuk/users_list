import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/use_cases/get_user_by_id_use_case.dart';

// Events
sealed class UserDetailsEvent {}

class UserDetailsInitEvent extends UserDetailsEvent {
  UserDetailsInitEvent(this.userId);
  final int userId;
}

// States
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

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc({
    required GetUserByIdUseCase getUserByIdUseCase,
  })  : _getUserByIdUseCase = getUserByIdUseCase,
        super(UserDetailsInitial()) {
    on<UserDetailsInitEvent>(_onInitEvent);
  }

  final GetUserByIdUseCase _getUserByIdUseCase;

  Future<void> _onInitEvent(
    UserDetailsInitEvent event,
    Emitter<UserDetailsState> emit,
  ) async {
    try {
      emit(UserDetailsInitial());
      final user = await _getUserByIdUseCase(event.userId);
      emit(UserDetailsLoaded(user));
    } catch (e) {
      emit(UserDetailsError(e.toString()));
    }
  }
}
