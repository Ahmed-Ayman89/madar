import 'package:equatable/equatable.dart';

class PackageEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String badge;
  final String badgeAr;
  final num price;
  final String currency;
  final String billingCycle;
  final String billingCycleAr;
  final List<PackageFeatureEntity> features;
  final String ctaLabel;
  final String ctaLabelAr;
  final String ctaUrl;
  final String ctaUrlAr;
  final int order;
  final bool isActive;
  final bool isFeatured;
  final String slug;

  const PackageEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.badge,
    required this.badgeAr,
    required this.price,
    required this.currency,
    required this.billingCycle,
    required this.billingCycleAr,
    required this.features,
    required this.ctaLabel,
    required this.ctaLabelAr,
    required this.ctaUrl,
    required this.ctaUrlAr,
    required this.order,
    required this.isActive,
    required this.isFeatured,
    required this.slug,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        badge,
        badgeAr,
        price,
        currency,
        billingCycle,
        billingCycleAr,
        features,
        ctaLabel,
        ctaLabelAr,
        ctaUrl,
        ctaUrlAr,
        order,
        isActive,
        isFeatured,
        slug,
      ];
}

class PackageFeatureEntity extends Equatable {
  final String title;
  final String titleAr;

  const PackageFeatureEntity({
    required this.title,
    required this.titleAr,
  });

  @override
  List<Object?> get props => [title, titleAr];
}
