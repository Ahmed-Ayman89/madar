import 'package:flutter/material.dart';
import '../../domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.title,
    required super.description,
    required super.iconUrl,
    required super.imageUrl,
    required super.slug,
    required super.order,
    required super.colors,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      description: json['description'] ?? '',
      iconUrl: json['icon']?['url'] ?? '',
      imageUrl: json['image']?['url'] ?? json['imageCover'] ?? '',
      slug: json['slug'] ?? '',
      order: json['order'] ?? 0,
      colors: _parseColors(json['color']),
    );
  }

  static List<Color> _parseColors(dynamic colorData) {
    try {
      if (colorData is String && colorData.isNotEmpty) {
        return colorData.split(',').map((c) {
          String hex = c.trim().replaceAll('#', '');
          if (hex.length == 6) {
            return Color(int.parse('FF$hex', radix: 16));
          }
          return Colors.blue;
        }).toList();
      }
    } catch (e) {
      debugPrint('Error parsing colors: $e');
    }
    return [const Color(0xFF259CCB), const Color(0xFF10B3D2)]; // Premium fallback
  }

  ServiceEntity toEntity() => this;
}
