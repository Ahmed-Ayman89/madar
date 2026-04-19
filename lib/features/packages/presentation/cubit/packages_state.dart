import '../../domain/entities/package_entity.dart';

abstract class PackagesState {}

class PackagesInitial extends PackagesState {}

class PackagesLoading extends PackagesState {}

class PackagesLoaded extends PackagesState {
  final List<PackageEntity> packages;
  PackagesLoaded(this.packages);
}

class PackagesError extends PackagesState {
  final String message;
  PackagesError(this.message);
}
