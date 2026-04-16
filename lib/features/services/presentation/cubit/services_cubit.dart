import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/services_repository.dart';
import 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _servicesRepository;

  ServicesCubit(this._servicesRepository) : super(ServicesInitial());

  Future<void> getServices({String? lang}) async {
    try {
      emit(ServicesLoading());
      final response = await _servicesRepository.getServices(lang: lang);

      if (response.isSuccess) {
        emit(ServicesLoaded(response.data!));
      } else {
        emit(ServicesError(response.message ?? 'Failed to load services'));
      }
    } catch (e) {
      emit(ServicesError('Unexpected error: ${e.toString()}'));
    }
  }
}
