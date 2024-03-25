class UserEntity {
  final String name;
  final String gender;
  final Location location;
  final String picture;
  final String email;
  final String phone;

  UserEntity({
    required this.name,
    required this.gender,
    required this.location,
    required this.email,
    required this.picture,
    required this.phone,
  });

  String get fullLocation => '${location.city}, ${location.state}, ${location.country}';
}

class Location {
  final String city;
  final String state;
  final String country;
  final Street street;

  Location({
    required this.city,
    required this.state,
    required this.country,
    required this.street,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        street: Street.fromJson(json['street']),
      );
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json['number'],
        name: json['name'],
      );
}
