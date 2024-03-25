import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:random_user_app/core/network/dio_client.dart';
import 'package:random_user_app/data/datasources/user_datasource_impl.dart';
import 'package:random_user_app/data/repositories/user_repository_impl.dart';
import 'package:random_user_app/domain/datasources/user_datasource.dart';
import 'package:random_user_app/domain/repositories/repositories.dart';

final getIt = GetIt.instance;

///
/// Service Locator - Dependency injection
///
class ServiceLocator {
  ServiceLocator._();

  ///
  /// Setup all dependencies
  ///
  static void setup() {
    /// Dio Client
    getIt.registerSingleton<DioClient>(
      DioClient(Dio()),
    );

    /// Datasource
    getIt.registerLazySingleton<UserDatasource>(
      () => UserDatasourceImpl(getIt.get<DioClient>()),
    );

    /// Repository
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getIt.get<UserDatasource>()),
    );
  }
}
