import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/domain/use_cases/get_users_use_case.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit({
    required GetUsersUseCase getUsersUseCase,
  })  : _getUsersUseCase = getUsersUseCase,
        super(UserListInitial());

  final GetUsersUseCase _getUsersUseCase;

  Future<void> init() async {
    try {
      emit(UserListInitial());
      final users = await _getUsersUseCase();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError());
    }
  }

  Future<void> loadMoreUsers() async {
    if (state case final UserListLoaded loadedState) {
      if (loadedState.isLoadingMore) {
        return;
      }
      try {
        emit(loadedState.copyWith(isLoadingMore: true));
        final users = await _getUsersUseCase(skip: loadedState.users.length);
        emit(UserListLoaded([...loadedState.users, ...users]));
      } catch (e) {
        log('Error loading more users: $e');
        emit(loadedState);
      }
    }
  }
}

sealed class UserListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoaded extends UserListState {
  UserListLoaded(this.users, {this.isLoadingMore = false});
  final List<User> users;
  final bool isLoadingMore;

  @override
  List<Object?> get props => [users, isLoadingMore];

  UserListLoaded copyWith({
    bool? isLoadingMore,
  }) {
    return UserListLoaded(
      users,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class UserListError extends UserListState {}
