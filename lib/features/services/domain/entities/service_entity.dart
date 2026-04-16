import 'package:flutter/material.dart';

class ServiceEntity {
  final String id;
  final String title;
  final String description;
  final String iconUrl;
  final String imageUrl;
  final String slug;
  final int order;
  final List<Color> colors;

  const ServiceEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.iconUrl,
    required this.imageUrl,
    required this.slug,
    required this.order,
    required this.colors,
  });
}
