import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<Response> getRandomUser();
}
