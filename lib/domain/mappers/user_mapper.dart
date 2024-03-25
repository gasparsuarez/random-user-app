import 'package:random_user_app/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity rawResponseToEntity(Map<String, dynamic> response) => UserEntity(
        name: '${response['name']['title']}. ${response['name']['first']}',
        picture: response['picture']['large'],
        gender: response['gender'],
        location: Location.fromJson(response['location']),
        email: response['email'],
        phone: response['phone'],
      );
}
