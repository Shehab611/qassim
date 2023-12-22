import 'package:equatable/equatable.dart';

final class CustomerServiceRequestModel extends Equatable {
  final String email;
  final String name;
  final String subject;
  final String message;

  @override
  List<Object> get props => [email, name, subject, message];

  const CustomerServiceRequestModel(
      {required this.email,
      required this.name,
      required this.subject,
      required this.message});

  Map<String, dynamic> toJson() {
    return {
      'fullName': name,
      'email': email,
      'topic': subject,
      'subject': message
    };
  }
}
