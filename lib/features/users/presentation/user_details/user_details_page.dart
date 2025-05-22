import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/di.dart';
import 'package:users_list/features/users/presentation/user_details/user_details_cubit.dart';

@RoutePage()
class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<UserDetailsCubit>()..init(userId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
          builder: (context, state) {
            return switch (state) {
              UserDetailsInitial() => const Center(
                  child: CircularProgressIndicator(),
                ),
              UserDetailsLoaded() => Center(
                  child: Text(
                    state.user.firstName,
                  ),
                ),
              UserDetailsError() => const Center(
                  child: Text('Error'),
                ),
            };
          },
        ),
      ),
    );
  }
}
