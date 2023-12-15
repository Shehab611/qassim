class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String accessToken;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.accessToken,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'] as int,
      name: json['user']['name'] as String,
      email: json['user']['email'] as String,
      phone: json['user']['phone'] as String,
      accessToken: json['user']['access_token'] as String,
      emailVerifiedAt: json['user']['email_verified_at'] as String?,
      createdAt: json['user']['created_at'] as String,
      updatedAt: json['user']['updated_at'] as String,
    );
  }
}
