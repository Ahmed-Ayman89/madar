import 'package:equatable/equatable.dart';

class SettingEntity extends Equatable {
  final String id;
  final String companyName;
  final String companyNameAr;
  final String phone;
  final String whatsapp;
  final String email;
  final String supportEmail;
  final String address;
  final String addressAr;
  final List<dynamic> paymentIcons;
  final String footerText;
  final String footerTextAr;
  final String copyright;
  final String copyrightAr;
  final SettingImageEntity? logo;
  final SettingImageEntity? favicon;
  final List<dynamic> socialMedia;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SettingEntity({
    required this.id,
    required this.companyName,
    required this.companyNameAr,
    required this.phone,
    required this.whatsapp,
    required this.email,
    required this.supportEmail,
    required this.address,
    required this.addressAr,
    required this.paymentIcons,
    required this.footerText,
    required this.footerTextAr,
    required this.copyright,
    required this.copyrightAr,
    this.logo,
    this.favicon,
    required this.socialMedia,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        companyName,
        companyNameAr,
        phone,
        whatsapp,
        email,
        supportEmail,
        address,
        addressAr,
        paymentIcons,
        footerText,
        footerTextAr,
        copyright,
        copyrightAr,
        logo,
        favicon,
        socialMedia,
        createdAt,
        updatedAt,
      ];
}

class SettingImageEntity extends Equatable {
  final String url;
  final String alt;
  final String altAr;

  const SettingImageEntity({
    required this.url,
    required this.alt,
    required this.altAr,
  });

  @override
  List<Object?> get props => [url, alt, altAr];
}
