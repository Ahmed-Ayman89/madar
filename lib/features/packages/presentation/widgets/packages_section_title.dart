import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/localization/app_localizations.dart';

class PackagesSectionTitle extends StatelessWidget {
  const PackagesSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'packages_section_title'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              'packages_section_subtitle'.tr(context),
              style: AppTextStyle.setStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ).copyWith(height: 1.6),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
