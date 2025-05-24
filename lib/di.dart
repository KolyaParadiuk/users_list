import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:users_list/common/config/network_config.dart';
import 'package:users_list/common/network/api/api.dart';
import 'package:users_list/features/users/di/user_feature_dependency_resolver.dart';

final di = GetIt.instance;

class ApplicationDependenciesResolver {
  static void resolve(
    NetworkConfig networkConfig,
  ) {
    _common(networkConfig);
    _features();
  }

  static void _common(
    NetworkConfig networkConfig,
  ) {
    di.registerSingleton<UsersApi>(UsersApi(_getDio(networkConfig)));
  }

  static void _features() {
    UserFeatureDependencyResolver.resolve();
  }

  static Dio _getDio(NetworkConfig networkConfig) {
    final dio = Dio(
      BaseOptions(
        baseUrl: networkConfig.baseApiUrl,
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
