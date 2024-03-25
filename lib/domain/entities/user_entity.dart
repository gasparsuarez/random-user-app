class UserEntity {
  final String name;
  final String gender;
  final Location location;
  final String picture;
  final String email;

  UserEntity({
    required this.name,
    required this.gender,
    required this.location,
    required this.email,
    required this.picture,
  });

  String get fullLocation => '${location.city}, ${location.state}, ${location.country}';
}

class Location {
  final String city;
  final String state;
  final String country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json['city'],
        state: json['state'],
        country: json['country'],
      );
}
