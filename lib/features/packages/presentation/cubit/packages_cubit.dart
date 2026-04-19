import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/packages_repository.dart';
import 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackagesRepository _packagesRepository;

  PackagesCubit(this._packagesRepository) : super(PackagesInitial());

  Future<void> getPackages({String? lang}) async {
    try {
      emit(PackagesLoading());
      final response = await _packagesRepository.getPackages(lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(PackagesLoaded(response.data!));
        } else {
          emit(PackagesError(response.message ?? 'Failed to load packages'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(PackagesError('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
