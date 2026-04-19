import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/contact_entity.dart';
import '../../data/repositories/contact_repository_impl.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository _repository;

  ContactCubit(this._repository) : super(ContactInitial());

  Future<void> sendMessage(ContactEntity contact) async {
    emit(ContactLoading());

    final response = await _repository.sendContactMessage(contact);

    if (response.isSuccess) {
      emit(ContactSuccess(response.message ?? 'Message sent successfully'));
    } else {
      emit(ContactError(response.message ?? 'Failed to send message'));
    }
  }
}
