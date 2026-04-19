import '../../domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.companyName,
    required super.projectType,
    required super.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'companyName': companyName,
      'projectType': projectType,
      'message': message,
    };
  }
}
