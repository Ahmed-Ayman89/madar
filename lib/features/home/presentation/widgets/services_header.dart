import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Category Title
        Text(
          'services_category'.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF259CCB),
          ),
        ),
        SizedBox(height: 8.h),
        // Main Header
        Text(
          'services_main_title'.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        // Description
        Text(
          'services_description'.tr(context),
          style: AppTextStyle.setStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.n300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
