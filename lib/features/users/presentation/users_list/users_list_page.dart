import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/common/network/ui/widgets/lazy_loading_wrapper.dart';
import 'package:users_list/di.dart';
import 'package:users_list/features/users/presentation/users_list/user_list_cubit.dart';
import 'package:users_list/routing/app_router.gr.dart';

@RoutePage()
class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<UserListCubit>()..init(),
      child: Scaffold(
        body: BlocBuilder<UserListCubit, UserListState>(
          builder: (context, state) {
            return switch (state) {
              UserListInitial() => const Center(
                  child: CircularProgressIndicator(),
                ),
              UserListLoaded() => _UsersListBody(state: state),
              UserListError() => Center(
                  child: Column(
                    children: [
                      const Text('Error'),
                      ElevatedButton(
                        onPressed: () => context.read<UserListCubit>().init(),
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}

class _UsersListBody extends StatefulWidget {
  const _UsersListBody({
    required this.state,
  });

  final UserListLoaded state;

  @override
  State<_UsersListBody> createState() => _UsersListBodyState();
}

class _UsersListBodyState extends State<_UsersListBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final users = widget.state.users;
    return SafeArea(
      child: LazyLoadingWrapper(
        controller: _scrollController,
        loadMore: () => context.read<UserListCubit>().loadMoreUsers(),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => context.read<UserListCubit>().init(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: users.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(users[index].firstName),
                    onTap: () => context.router.push(
                      UserDetailsRoute(
                        userId: users[index].id,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.state.isLoadingMore)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
