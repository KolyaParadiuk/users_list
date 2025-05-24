import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/common/network/ui/assets.dart';
import 'package:users_list/common/network/ui/colors.dart';
import 'package:users_list/common/network/ui/shaders.dart';
import 'package:users_list/common/network/ui/topography.dart';
import 'package:users_list/common/network/ui/widgets/error_placeholder.dart';
import 'package:users_list/common/network/ui/widgets/loading_widget.dart';
import 'package:users_list/common/network/ui/widgets/page_color_box.dart';
import 'package:users_list/di.dart';
import 'package:users_list/features/users/domain/entity/user.dart';
import 'package:users_list/features/users/presentation/resources/hero_image_key.dart';
import 'package:users_list/features/users/presentation/user_details/user_details_bloc.dart';
import 'package:users_list/gen/locale_keys.g.dart';

const headerHeight = 211.0;

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
      create: (context) =>
          di.get<UserDetailsBloc>()..add(UserDetailsInitEvent(userId)),
      child: Scaffold(
        body: PageColorBox(
          child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
            builder: (context, state) {
              return switch (state) {
                UserDetailsInitial() => const LoadingWidget(),
                UserDetailsLoaded() => _UserDetailsWidget(user: state.user),
                UserDetailsError() => const _UserDetailsErrorWidget(),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _UserDetailsWidget extends StatelessWidget {
  const _UserDetailsWidget({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    const contextPadding = EdgeInsets.fromLTRB(16, 12, 16, 32);
    return Stack(
      children: [
        ListView(
          padding: contextPadding,
          children: [
            const SizedBox(height: headerHeight),
            Text(
              user.fullName,
              textAlign: TextAlign.center,
              style: AppTextStyles.title34Semibold.copyWith(
                foreground: Paint()..shader = AppShaders.textGradientShager,
              ),
            ),
            Align(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.dateOfBirthLabel.tr(),
                      style: AppTextStyles.body16Regular.withColor(
                        AppColors.lightPink,
                      ),
                    ),
                    TextSpan(
                      text: ' • ',
                      style: AppTextStyles.body16Regular.withColor(
                        AppColors.lightPink.withValues(alpha: 0.4),
                      ),
                    ),
                    TextSpan(
                      text: user.birthDate,
                      style: AppTextStyles.body16Regular.withColor(
                        AppColors.lightPink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              LocaleKeys.userDetailsPlaceholder.tr(),
              style: AppTextStyles.body12Regular,
            ),
          ],
        ),
        _UserDetailsHeader(user: user),
      ],
    );
  }
}

class _UserDetailsHeader extends StatelessWidget {
  const _UserDetailsHeader({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final image = user.image;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: screenWidth,
              height: headerHeight,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.userImageBg,
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: (image != null)
                  ? Hero(
                      tag: heroImageKey(user.id),
                      child: Image.network(
                        image,
                        width: 160,
                        height: 160,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const Positioned(
              left: 12,
              top: 52,
              child: _BackButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserDetailsErrorWidget extends StatelessWidget {
  const _UserDetailsErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        children: [
          ErrorPlaceholder(),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12,
                top: 52,
              ),
              child: _BackButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.router.pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.white,
        size: 32,
      ),
    );
  }
}
