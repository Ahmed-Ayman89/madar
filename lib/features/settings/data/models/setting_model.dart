import '../../domain/entities/setting_entity.dart';

class SettingModel extends SettingEntity {
  const SettingModel({
    required super.id,
    required super.companyName,
    required super.companyNameAr,
    required super.phone,
    required super.whatsapp,
    required super.email,
    required super.supportEmail,
    required super.address,
    required super.addressAr,
    required super.paymentIcons,
    required super.footerText,
    required super.footerTextAr,
    required super.copyright,
    required super.copyrightAr,
    super.logo,
    super.favicon,
    required super.socialMedia,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      id: json['_id'] ?? '',
      companyName: json['companyName'] ?? '',
      companyNameAr: json['companyNameAr'] ?? '',
      phone: json['phone'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      email: json['email'] ?? '',
      supportEmail: json['supportEmail'] ?? '',
      address: json['address'] ?? '',
      addressAr: json['addressAr'] ?? '',
      paymentIcons: json['paymentIcons'] != null
          ? List<dynamic>.from(json['paymentIcons'])
          : [],
      footerText: json['footerText'] ?? '',
      footerTextAr: json['footerTextAr'] ?? '',
      copyright: json['copyright'] ?? '',
      copyrightAr: json['copyrightAr'] ?? '',
      logo: json['logo'] != null
          ? SettingImageModel.fromJson(json['logo'])
          : null,
      favicon: json['favicon'] != null
          ? SettingImageModel.fromJson(json['favicon'])
          : null,
      socialMedia: json['socialMedia'] != null
          ? List<dynamic>.from(json['socialMedia'])
          : [],
      createdAt: DateTime.parse(
          json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'companyName': companyName,
      'companyNameAr': companyNameAr,
      'phone': phone,
      'whatsapp': whatsapp,
      'email': email,
      'supportEmail': supportEmail,
      'address': address,
      'addressAr': addressAr,
      'paymentIcons': paymentIcons,
      'footerText': footerText,
      'footerTextAr': footerTextAr,
      'copyright': copyright,
      'copyrightAr': copyrightAr,
      'logo': logo != null ? (logo as SettingImageModel).toJson() : null,
      'favicon': favicon != null ? (favicon as SettingImageModel).toJson() : null,
      'socialMedia': socialMedia,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class SettingImageModel extends SettingImageEntity {
  const SettingImageModel({
    required super.url,
    required super.alt,
    required super.altAr,
  });

  factory SettingImageModel.fromJson(Map<String, dynamic> json) {
    return SettingImageModel(
      url: json['url'] ?? '',
      alt: json['alt'] ?? '',
      altAr: json['altAr'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'alt': alt,
      'altAr': altAr,
    };
  }
}
