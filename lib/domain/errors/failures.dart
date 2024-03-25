import 'package:dio/dio.dart';

abstract class Failure {}

class NetworkFailure extends Failure {}

class BadRequestFailure extends Failure {}

class UnknownFailure extends Failure {}

///
/// DioExceptionType to Failure handler
///
Failure handleExceptionToFailure(DioExceptionType e) {
  switch (e) {
    case DioExceptionType.connectionError:
      return NetworkFailure();
    case DioExceptionType.badResponse:
      return BadRequestFailure();
    default:
      return UnknownFailure();
  }
}
