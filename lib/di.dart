import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:users_list/common/network/api/api.dart';
import 'package:users_list/features/users/di/user_feature_dependency_resolver.dart';

final di = GetIt.instance;

class ApplicationDependenciesResolver {
  static void resolve() {
    _common();
    _features();
  }

  static void _common() {
    di.registerSingleton<UsersApi>(UsersApi(_getDio()));
  }

  static void _features() {
    UserFeatureDependencyResolver.resolve();
  }

  static Dio _getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        headers: {
          'content-type': 'application/json',
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  }
}
