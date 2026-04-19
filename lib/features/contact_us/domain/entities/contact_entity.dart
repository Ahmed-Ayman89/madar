import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String projectType;
  final String message;

  const ContactEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.projectType,
    required this.message,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        companyName,
        projectType,
        message,
      ];
}
