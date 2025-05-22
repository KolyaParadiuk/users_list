// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:users_list/features/users/presentation/user_details/user_details_page.dart'
    as _i1;
import 'package:users_list/features/users/presentation/users_list/users_list_page.dart'
    as _i2;

/// generated route for
/// [_i1.UserDetailsPage]
class UserDetailsRoute extends _i3.PageRouteInfo<void> {
  const UserDetailsRoute({List<_i3.PageRouteInfo>? children})
    : super(UserDetailsRoute.name, initialChildren: children);

  static const String name = 'UserDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.UserDetailsPage();
    },
  );
}

/// generated route for
/// [_i2.UsersListPage]
class UsersListRoute extends _i3.PageRouteInfo<void> {
  const UsersListRoute({List<_i3.PageRouteInfo>? children})
    : super(UsersListRoute.name, initialChildren: children);

  static const String name = 'UsersListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.UsersListPage();
    },
  );
}
