import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full screen image
        Positioned.fill(child: Image.asset(model.image, fit: BoxFit.cover)),
        // Gradient for text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 0.95],
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.9),
                ],
              ),
            ),
          ),
        ),
        // Text Content
        Positioned(
          bottom: 180.h,
          left: 20.w,
          right: 20.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: AppTextStyle.heading1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyRegular.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
