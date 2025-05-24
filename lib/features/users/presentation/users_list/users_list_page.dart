import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:users_list/common/network/ui/gradients.dart';
import 'package:users_list/common/network/ui/topography.dart';
import 'package:users_list/common/network/ui/widgets/error_placeholder.dart';
import 'package:users_list/common/network/ui/widgets/lazy_loading_wrapper.dart';
import 'package:users_list/common/network/ui/widgets/loading_widget.dart';
import 'package:users_list/common/network/ui/widgets/page_color_box.dart';
import 'package:users_list/di.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/presentation/resources/hero_image_key.dart';
import 'package:users_list/features/users/presentation/users_list/user_list_cubit.dart';
import 'package:users_list/gen/locale_keys.g.dart';
import 'package:users_list/routing/app_router.gr.dart';

@RoutePage()
class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<UserListCubit>()..init(),
      child: Scaffold(
        body: PageColorBox(
          child: BlocBuilder<UserListCubit, UserListState>(
            builder: (context, state) {
              // Using Dart's switch expression to handle different UI states
              // This ensures exhaustive handling of all sealed class variants
              return switch (state) {
                UserListInitial() => const LoadingWidget(),
                UserListLoaded() => _UsersListBody(state: state),
                UserListError() => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ErrorPlaceholder(),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          onPressed: () => context.read<UserListCubit>().init(),
                          child: Text(
                            LocaleKeys.tryAgain.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
              };
            },
          ),
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
      bottom: false,
      child: LazyLoadingWrapper(
        controller: _scrollController,
        loadMore: () => context.read<UserListCubit>().loadMoreUsers(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 11,
              ),
              child: Text(
                LocaleKeys.usersListTitle.tr(),
                style: AppTextStyles.title26Regular,
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => context.read<UserListCubit>().init(),
                child: Stack(
                  children: [
                    // Semi-transparent background creates a layered effect
                    // Using Stack and Opacity for visual depth
                    // without affecting content
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          gradient: AppGradients.bgGradient,
                        ),
                      ),
                    ),
                    ListView.builder(
                      controller: _scrollController,
                      itemCount: users.length,
                      itemBuilder: (context, index) => UserListTile(
                        user: users[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.state.isLoadingMore)
              const Padding(
                padding: EdgeInsets.only(bottom: 32.0, top: 8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

class UserListTile extends StatelessWidget {
  const UserListTile({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    final image = user.image;
    return ListTile(
      horizontalTitleGap: 12,
      minTileHeight: 96,
      leading: image != null
          ? Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: AppGradients.borderGradient,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Hero(
                // Hero widget enables smooth transition animations
                // Using a consistent tag ensures proper image animation
                // when navigating between the list and detail views
                tag: heroImageKey(user.id),
                child: Image.network(image),
              ),
            )
          : const SizedBox.shrink(),
      title: Text(
        user.firstName,
        style: AppTextStyles.subtitle18Semibold,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.address.country,
            style: AppTextStyles.body14Regular,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            user.age.toString(),
            style: AppTextStyles.body14Regular,
          ),
        ],
      ),
      onTap: () => context.router.push(
        UserDetailsRoute(
          userId: user.id,
        ),
      ),
    );
  }
}
