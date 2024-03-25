import 'package:dartz/dartz.dart';
import 'package:random_user_app/domain/domain.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getRandomUser();
}
