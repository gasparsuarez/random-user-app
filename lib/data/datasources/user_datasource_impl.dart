import 'package:dio/dio.dart';
import 'package:random_user_app/core/network/dio_client.dart';
import 'package:random_user_app/domain/domain.dart';

class UserDatasourceImpl extends UserDatasource {
  final DioClient _client;

  /// Dependency injection
  UserDatasourceImpl(this._client);

  @override
  Future<Response> getRandomUser() => _client.dio.get('');
}
