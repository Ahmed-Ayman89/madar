import 'package:flutter/material.dart';
import 'dart:math';

class NavBarPainter extends CustomPainter {
  final Gradient backgroundColor;
  final double xCenter;

  NavBarPainter({required this.backgroundColor, required this.xCenter});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = backgroundColor.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.fill;

    final path = Path();
    final double w = size.width;
    final double h = size.height;
    const double r = 10.0; // Corner radius
    const double scoopRadius = 41.0; // Base radius of the scoop

    // DRAW BACKGROUND PATH WITH EDGE PROTECTION
    // 1. Start from top-left corner
    path.moveTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);

    double halfWidth = scoopRadius * 1.5;

    // 2. Move to the start of the scoop, but never go before 'r'
    double currentX = r;
    double scoopStart = max(currentX, xCenter - halfWidth);
    path.lineTo(scoopStart, 0);
    currentX = scoopStart;

    // 3. Smooth S-curve into the scoop
    // Ensure control points always move FORWARD from currentX
    path.cubicTo(
      max(currentX, xCenter - scoopRadius),
      0,
      max(currentX, xCenter - scoopRadius * 0.9),
      scoopRadius * 0.9,
      max(currentX, xCenter),
      scoopRadius * 0.9,
    );
    currentX = max(currentX, xCenter);

    // 4. Smooth S-curve out of the scoop
    // Ensure control points always move FORWARD towards w-r
    double scoopEnd = min(w - r, xCenter + halfWidth);
    path.cubicTo(
      min(scoopEnd, xCenter + scoopRadius * 0.9),
      scoopRadius * 0.9,
      min(scoopEnd, xCenter + scoopRadius),
      0,
      scoopEnd,
      0,
    );
    currentX = scoopEnd;

    // 5. Line to the top-right corner
    path.lineTo(w - r, 0);
    path.quadraticBezierTo(w, 0, w, r);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavBarPainter oldDelegate) =>
      oldDelegate.xCenter != xCenter;
}
