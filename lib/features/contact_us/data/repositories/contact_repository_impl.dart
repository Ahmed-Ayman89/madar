import 'package:madar/core/network/api_response.dart';
import '../../domain/entities/contact_entity.dart';
import '../data_sources/contact_remote_data_source.dart';
import '../models/contact_model.dart';

abstract class ContactRepository {
  Future<ApiResponse<void>> sendContactMessage(ContactEntity contact);
}

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource _remoteDataSource;

  ContactRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<void>> sendContactMessage(ContactEntity contact) async {
    final model = ContactModel(
      name: contact.name,
      email: contact.email,
      phone: contact.phone,
      companyName: contact.companyName,
      projectType: contact.projectType,
      message: contact.message,
    );
    return _remoteDataSource.sendContactMessage(model);
  }
}
