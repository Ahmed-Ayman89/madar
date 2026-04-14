import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class AboutUsSecondaryHeader extends StatelessWidget {
  const AboutUsSecondaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'about_madar_title'.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0E1A39),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'about_madar_description'.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF1F1F1F),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
