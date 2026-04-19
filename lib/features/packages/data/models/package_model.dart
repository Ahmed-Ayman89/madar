import '../../domain/entities/package_entity.dart';

class PackageModel extends PackageEntity {
  const PackageModel({
    required super.id,
    required super.title,
    required super.description,
    required super.badge,
    required super.badgeAr,
    required super.price,
    required super.currency,
    required super.billingCycle,
    required super.billingCycleAr,
    required super.features,
    required super.ctaLabel,
    required super.ctaLabelAr,
    required super.ctaUrl,
    required super.ctaUrlAr,
    required super.order,
    required super.isActive,
    required super.isFeatured,
    required super.slug,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      badge: json['badge'] ?? '',
      badgeAr: json['badgeAr'] ?? '',
      price: json['price'] ?? 0,
      currency: json['currency'] ?? 'SAR',
      billingCycle: json['billingCycle'] ?? 'monthly',
      billingCycleAr: json['billingCycleAr'] ?? '',
      features: (json['features'] as List? ?? [])
          .map((f) => PackageFeatureModel.fromJson(f))
          .toList(),
      ctaLabel: json['ctaLabel'] ?? '',
      ctaLabelAr: json['ctaLabelAr'] ?? '',
      ctaUrl: json['ctaUrl'] ?? '',
      ctaUrlAr: json['ctaUrlAr'] ?? '',
      order: json['order'] ?? 0,
      isActive: json['isActive'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'badge': badge,
      'badgeAr': badgeAr,
      'price': price,
      'currency': currency,
      'billingCycle': billingCycle,
      'billingCycleAr': billingCycleAr,
      'features':
          features.map((f) => (f as PackageFeatureModel).toJson()).toList(),
      'ctaLabel': ctaLabel,
      'ctaLabelAr': ctaLabelAr,
      'ctaUrl': ctaUrl,
      'ctaUrlAr': ctaUrlAr,
      'order': order,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'slug': slug,
    };
  }
}

class PackageFeatureModel extends PackageFeatureEntity {
  const PackageFeatureModel({
    required super.title,
    required super.titleAr,
  });

  factory PackageFeatureModel.fromJson(Map<String, dynamic> json) {
    return PackageFeatureModel(
      title: json['title'] ?? '',
      titleAr: json['titleAr'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'titleAr': titleAr,
    };
  }
}
