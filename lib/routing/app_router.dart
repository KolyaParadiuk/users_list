import 'package:auto_route/auto_route.dart';
import 'package:users_list/routing/app_router.gr.dart';
import 'package:users_list/routing/routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: UsersListRoute.page,
          path: Routes.usersList,
          initial: true,
        ),
        AutoRoute(
          page: UserDetailsRoute.page,
          path: Routes.userDetails,
        ),
      ];
}
