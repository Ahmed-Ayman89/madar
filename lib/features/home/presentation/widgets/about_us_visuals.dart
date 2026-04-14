import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsVisuals extends StatelessWidget {
  const AboutUsVisuals({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Image.asset(
        'assets/photo/about Us.png',
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
