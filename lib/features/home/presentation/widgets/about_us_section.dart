import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';
import 'about_us_visuals.dart';
import 'about_us_stats_row.dart';
import 'about_us_secondary_header.dart'; // New import

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Header Section
          Text(
            'about_company_category'.tr(context),
            style: AppTextStyle.setStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF259CCB),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'about_company_main_title'.tr(context),
            style: AppTextStyle.setStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            'about_company_description'.tr(context),
            style: AppTextStyle.setStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.n300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),

          // 2. Visual Grid Section (Simplified to Image based on user request)
          const AboutUsVisuals(),

          SizedBox(height: 40.h),

          // 3. Secondary Header (New Section requested)
          const AboutUsSecondaryHeader(),

          SizedBox(height: 20.h),

          // 4. Stats Section (Modular)
          const AboutUsStatsRow(),
        ],
      ),
    );
  }
}
