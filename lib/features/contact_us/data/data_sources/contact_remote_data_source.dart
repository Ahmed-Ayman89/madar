import 'package:madar/core/network/api_endpoint.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/network/api_response.dart';
import '../models/contact_model.dart';

class ContactRemoteDataSource {
  final APIHelper _apiHelper;

  ContactRemoteDataSource(this._apiHelper);

  Future<ApiResponse<void>> sendContactMessage(ContactModel contact) async {
    return _apiHelper.postRequest<void>(
      endPoint: EndPoints.contact,
      data: contact.toJson(),
      isFormData: false, // Schema looks like a standard JSON body
      isAuthorized: false, // Contact us is usually public
    );
  }
}
