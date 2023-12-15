class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String accessToken;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'] as int,
      name: json['user']['name'] as String,
      email: json['user']['email'] as String,
      phone: json['user']['phone'] as String,
      accessToken: json['user']['access_token'] as String,
    );
  }
}
