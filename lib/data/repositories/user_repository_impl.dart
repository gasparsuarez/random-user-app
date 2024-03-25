import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:random_user_app/domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;

  /// Dependency injection
  UserRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> getRandomUser() async {
    try {
      final response = await _datasource.getRandomUser();
      final Map<String, dynamic> rawUser = (response.data['results'] as List).first;
      return Right(UserMapper.rawResponseToEntity(rawUser));
    } on DioException catch (e) {
      return Left(handleExceptionToFailure(e.type));
    }
  }
}
