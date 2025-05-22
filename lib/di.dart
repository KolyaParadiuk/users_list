import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:users_list/common/network/api/api.dart';

final di = GetIt.instance;

class ApplicationDependenciesResolver {
  static Future<void> resolve() async {
    await _common();
    await _features();
  }

  static Future<void> _common() async {
    di.registerSingleton<UsersApi>(UsersApi(await _getDio()));
  }

  static Future<void> _features() async {}

  static Future<Dio> _getDio() async {
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
